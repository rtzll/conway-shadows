require 'bitmap'
require 'color'

describe Bitmap do

  width, height = 2, 2
  factor = 2

  before(:each) do
    @bitmap = Bitmap.new width, height
  end

  describe "when initialized" do
    it "should have the correct width and height" do
      expect(@bitmap.data.length).to eq width
      expect(@bitmap.data[0].length).to eq height
    end
    it "should have random color entries" do
      expect(@bitmap.data[0][0]).to be_a RandomColor
    end
  end

  describe "when enlarged" do
    before(:each) do
      @bitmap.enlarge factor
    end
    it "should be factor times greater in width and height." do
      expect(@bitmap.data.length).to eq width*factor
      (height*factor).times do |index|
        expect(@bitmap.data[index].length).to eq height*factor
      end
    end
  end
end

# TODO add tests for width and heigth stretch
