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
end
