require 'color'

# The bitmap object.
# A 2D array with rgb values as entries.
class Bitmap
  attr_reader :data

  def initialize(width, height, color=nil)
    @data = Array.new(width) do
      Array.new(height) do
        color || RandomColor.new
      end
    end
  end

  # Enlarge the data by a given factor.
  def enlarge(factor)
    widened_data = stretch_width @data[0].length, factor
    @data  = stretch_height @data.length, factor, widened_data
  end

  def stretch_width(width, factor)
    stretched = Array.new(width) { [] }
    @data.each_with_index do |row, row_index|
      row.each do |entry|
        factor.times { stretched[row_index] << entry }
      end
    end
    stretched
  end

  def stretch_height(height, factor, data)
    stretched = Array.new(height) { [] }
    0.upto(factor*height - 1) do |index|
      stretched[index] = data[index/factor]
    end
    stretched
  end

end
