require 'logger'
require_relative 'Wall'

class Field
  def initialize (x, y, wall_orientations)
    @x = x
    @y = y

    @walls = []
    logger = Logger.new(STDOUT)
    logger.debug(wall_orientations)
    wall_orientations.each do |wall_orientation|
        @walls << (Wall.new(x,y,wall_orientation))
    end
  end

  def draw
    @walls.each do |wall|
      wall.draw
    end
  end

end
