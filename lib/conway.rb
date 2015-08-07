
class Conway
  attr_reader :grid

  def initialize
    @grid = Grid.new 53, 7
  end
end

class Grid
  attr_reader :width, :heigth , :fields

  def initialize(width, heigth)
    @width, @heigth = width, heigth
  end
end
