require 'bitmap'

RSpec.describe Bitmap, "#init" do
  context "With a given width and height" do
    it "initializes a 2D array with random RGB values"
    bitmap = Bitmap.new
    expect(bitmap.data[0]).to eq 1
  end
end
