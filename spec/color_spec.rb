require 'color'

RSpec.describe RandomColor, "#init" do
  it "initializes a rgb color with values between 0 and 255" do
    color = RandomColor.new
    expect(color.r).to be_within(128).of 128
    expect(color.g).to be_within(128).of 128
    expect(color.b).to be_within(128).of 128
  end
end
