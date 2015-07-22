require 'color'

# The bitmap object.
# A 2D array with rgb values as entries.
class Bitmap
  attr_reader :data

  def initialize(width, height)
    @data = Array.new(width) do
      Array.new(height) do
        RandomColor.new
      end
    end
  end

  # Enlarge the data by a given factor.
  def enlarge(factor)
    @data * factor
  end
end
