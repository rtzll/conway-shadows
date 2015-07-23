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
    enlarged_data = Array.new(factor * @data[0].length) { [] }
    @data.each_with_index do |row, row_index|
      shift = 0
      0.upto(factor) do |i|
        factor.times {enlarged_data[row_index+shift] << row }
        shift += i
      end
    end
    puts enlarged_data[0].to_s
    puts enlarged_data[0].length
    @data = enlarged_data
  end
end
