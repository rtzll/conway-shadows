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
    stretch_width factor
    stretch_height factor
  end

  def stretch_width(factor)
    width = @data[0].length
    stretched = Array.new(width) { [] }
    @data.each_with_index do |row, row_index|
      row.each do |entry|
        factor.times { stretched[row_index] << entry }
      end
    end
    @data = stretched
  end

  def stretch_height(factor)
    height = @data.length
    stretched = Array.new(height) { [] }
    (factor*height).times do |index|
      stretched[index] = @data[index/factor]
    end
    @data = stretched
  end

end
