
class Conway
  attr_reader :grid

  def initialize
    @grid = Grid.new 53, 7
  end

  def start
    number_of_living_cells = (grid.width * grid.heigth * 0.2).round
    number_of_living_cells.times { grid.revive_at(rand(53), rand(7)) }
  end
end

class Grid
  attr_reader :width, :heigth, :fields

  def initialize(width, heigth)
    @width, @heigth = width, heigth
    @fields = Array.new(width) do
      Array.new(heigth) do
        Cell.new
      end
    end
  end

  def each
    fields.each
  end

  def revive_at(column_index, row_index)
    cell = fields[column_index][row_index]
    cell.increment if cell.dead?
  end
end

class Cell
  attr_accessor :value

  def initialize(n = 0)
    @value = n
  end

  def dead?
    value <= 0
  end

  def alive?
    value > 0
  end

  def increment
    value += 1
  end

  def decrement
    value -= 1
  end
end

