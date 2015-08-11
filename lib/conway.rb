
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
		@fields = Array.new(width) do
			Array.new(heigth) do
				Cell.new
			end
		end
  end

	def each
		fields.each
	end
end

class Cell
  attr_reader :value

  def initialize(n = 0)
    @value = n
  end

  def empty?
    value == 0
  end
end

