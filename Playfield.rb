require_relative 'Field'

class Playfield
  def initialize width, height
    @fields = Array.new
    (0..width).each do |xcoordinate|
      yfields = Array.new
      @fields.push yfields
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
        random_wall = Random.rand(0..4)
        case random_wall
        when 1
          walls.push :South
        when 2
          walls.push :North
        when 3
          walls.push :West
        when 4
          walls.push :East
        end
        yfields.push Field.new(xcoordinate , ycoordinate,walls)
      end
    end
  end

  def way_between_two_fields_is_blocked field1, field2, wall_orientation
    if wall_orientation == :North
      opposite_wall_orientation = :South
    elsif wall_orientation == :South
      opposite_wall_orientation = :Noth
    elsif wall_orientation == :West
      opposite_wall_orientation = :East
    else
      opposite_wall_orientation = :West
    end
    
    @fields[field1.x][field1.y].has_wall wall_orientation or @fields[field2.x][field2.y].has_wall opposite_wall_orientation
    
  end

  def draw
    @fields.each do |fieldarray|
      fieldarray.each do |field|
        field.draw
      end
    end
  end

end
