require 'conway'

describe Conway do

  before(:each) do
    @conway = Conway.new
  end

  describe "when initialized" do
    it "should have the correct field dimensions" do
      expect(@conway.field.width).to eq 53
      expect(@conway.field.heigth).to eq 7
    end
  end
end
