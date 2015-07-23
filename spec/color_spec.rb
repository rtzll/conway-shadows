require 'color'

RSpec.describe Color, "#to_s" do
  it "converts the color to a string with r, g, b (in that order)" do
    color = Color.new 1, 2, 3
    expect(color.to_s).to eq "1, 2, 3"
  end
end

RSpec.describe RandomColor, "#init" do
  it "initializes a rgb color with values between 0 and 255" do
    color = RandomColor.new
    expect(color.r).to be_within(128).of 128
    expect(color.g).to be_within(128).of 128
    expect(color.b).to be_within(128).of 128
  end
end
