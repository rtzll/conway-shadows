require 'bitmap'
require 'color'

describe Bitmap do

  width, height = 2, 2
  factor = 2
  image_name = "bitmap.bmp"

  before(:each) do
    @bitmap = Bitmap.new width, height
  end

  describe "when initialized" do
    it "should have the correct width and height" do
      expect(@bitmap.width).to eq width
      expect(@bitmap.height).to eq height
    end
    it "should have random color entries" do
      @bitmap.data.each do |row|
        row.each do |entry|
          expect(entry).to be_a RandomColor
        end
      end
    end
  end

  describe "when enlarged" do
    before(:each) do
      @bitmap.enlarge factor
    end
    it "should be factor times greater in width and height." do
      expect(@bitmap.height).to eq height*factor
      (height*factor).times do |index|
        expect(@bitmap.width).to eq width*factor
      end
    end
  end

  describe "when the bitmaps width is stretch" do
    before(:each) do
      @bitmap.stretch_width factor
    end
    it "should be factor times greater in width and the same in height" do
      expect(@bitmap.height).to eq height
      (height).times do |index|
        expect(@bitmap.width).to eq width*factor
      end
    end
  end

  describe "when the bitmaps height is stretch" do
    before(:each) do
      @bitmap.stretch_height factor
    end
    it "should be factor times greater in height and the same in width" do
      expect(@bitmap.height).to eq height*factor
      (height*factor).times do |index|
        expect(@bitmap.width).to eq width
      end
    end
  end

  describe "when the bitmap is written as image" do
    before(:each) do
      @bitmap.to_image image_name
    end
    it "should exist as a file" do
      expect File.exist?(image_name)
    end
    after(:each) do
      File.delete image_name
    end
  end

  def is_separator(index, every_n_pixels)
    index % every_n_pixels + 1 == 0
  end

  describe "when a separator is added" do
    white_pixel = Color.new 255, 255, 255
    n = 1
    before(:each) do
      @bitmap.add_separator n, white_pixel
    end
    it "should have been stretched in heigth and width" do
      expect(@bitmap.width).to be eq width * n - 1
      expect(@bitmap.width).to be eq height * n - 1
    end
    it "should have a white pixels every n pixels" do
      @bitmap.each_with_index do |row, row_index|
        row.each_with_index do |entry, column_index|
          if is_separator row_index or is_separator column_index
            expect(entry).to be eq white_pixel
          end
        end
      end
    end
  end
end
