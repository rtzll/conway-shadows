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
    enlarged_data = Array.new(@data[0].length) { [] }
    @data.each_with_index do |row, row_index|
      row.each do |entry|
        factor.times { enlarged_data[row_index] << entry }
      end
    end
    0.upto(factor*@data.length - 1) do |index|
      @data[index] = enlarged_data[index/factor]
    end
  end

end
