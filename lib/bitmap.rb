require 'color'
require 'rmagick'

# The bitmap object.
# A 2D array with rgb values as entries.
class Bitmap
  attr_reader :data, :width, :height

  def initialize(width, height)
    @width, @height = width, height
    @data = Array.new(@width) do
      Array.new(@height) do
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
    stretched = Array.new(@width) { [] }
    @data.each_with_index do |row, row_index|
      row.each do |entry|
        factor.times { stretched[row_index] << entry }
      end
    end
    @data, @width = stretched, @width*factor
  end

  def stretch_height(factor)
    stretched = Array.new(@height) { [] }
    (factor*@height).times do |index|
      stretched[index] = @data[index/factor]
    end
    @data, @height = stretched, @height*factor
  end

  def to_image(imagename)
    img = Magick::Image.new(@width, @height)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        img.pixel_color(row_index, column_index, "rgb(#{item.to_l.join(', ')})")
      end
    end
    img.write(imagename)
  end

end
