require 'bitmap'
require 'color'

RSpec.describe Bitmap, "#init" do
  context "With a given width and height" do
    width, height = 2, 2
    it "initializes a 2D array with given width and height" do
      bitmap = Bitmap.new width, height
      expect(bitmap.data.length).to eq width
      expect(bitmap.data[0].length).to eq height
    end
    it "initializes a 2D array with random color" do
      bitmap = Bitmap.new width, height
      expect(bitmap.data[0][0]).to be_a RandomColor
    end
  end
end


RSpec.describe Bitmap, "#enlarge" do
  context "With a given width, height and color" do
    width, height, factor = 2, 2, 2
    color = Color.new 1, 2, 3
    it "enlarging a 2x2 bitmap by 2 will yield a 4x4 bitmap." do
      bitmap = Bitmap.new width, height, color
      bitmap.enlarge 2
      # check length
      expect(bitmap.data.length).to eq width*factor
      expect(bitmap.data[0].length).to eq height*factor
      # check values
      expect(bitmap.data[0]).to eq [color, color] * factor
    end
  end
end
