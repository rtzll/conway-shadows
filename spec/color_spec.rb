require 'color'

describe Color do
  before(:each) do
    @color = Color.new 1, 2, 3
  end

  describe "when converted to string" do
    it "should equal the string with 'r, g, b' (in that order)" do
      expect(@color.to_s).to eq "1, 2, 3"
    end
  end

  describe "when converted to list" do
    it "should equal the list [r, g, b] (in that order)" do
      expect(@color.to_l).to eq [1, 2, 3]
    end
  end
end

describe RandomColor do
  before(:each) do
    @color = RandomColor.new
  end
  def to_be_between_0_and_255(expected)
    0 <= expected and expected <= 255
  end
  describe "when initialized" do
    it "should have entries with values between 0 and 255" do
      expect(to_be_between_0_and_255(@color.r))
      expect(to_be_between_0_and_255(@color.g))
      expect(to_be_between_0_and_255(@color.b))
    end
  end
end
