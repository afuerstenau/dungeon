require_relative 'Field'

class Playfield
  def initialize width, height
    @fields = Array.new
    (0..width).each do |xcoordinate|
      (0..height).each do |ycoordinate|
        walls = Array.new
        if (xcoordinate == 0)
          walls.push :West
        end
        if (xcoordinate == width)
          walls.push :East
        end
        if (ycoordinate == 0)
          walls.push :North
        end
        if (ycoordinate == height)
          walls.push :South
        end
        @fields.push Field.new(xcoordinate , ycoordinate,walls)
      end
    end
    
  end

  def draw
    @fields.each do |field|
      field.draw
    end
  end

end
