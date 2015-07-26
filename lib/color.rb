
# RGB Color
class Color
  attr_reader :r, :g, :b

  def initialize(r, g, b)
    @r, @g, @b = r, g, b
  end

  def to_s
    "#{r}, #{g}, #{b}"
  end

  def to_l
    [@r, @g, @b]
  end
end

class RandomColor < Color
  def initialize
    super rand(255), rand(255), rand(255)
  end
end
