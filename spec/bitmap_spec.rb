require 'bitmap'

RSpec.describe Bitmap, "#init" do
  context "With a given width and height" do
    width, height = 2, 2
    it "initializes a 2D array with given width and height" do
      bitmap = Bitmap.new width, height
      expect(bitmap.data.length).to eq width
      expect(bitmap.data[0].length).to eq height
    end
    it "initializes a 2D array with random RGB values" do
      bitmap = Bitmap.new width, height
      expect(bitmap.data[0][0].length).to eq 3
    end
  end
end
