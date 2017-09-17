require 'logger'
require_relative 'Wall'

class Field
  def initialize (x, y, wall_orientations)
    @wall_orientations = wall_orientations
    @walls = []
    wall_orientations.each do |wall_orientation|
        @walls << (Wall.new(x*90,y*100,wall_orientation))
    end
  end

  def draw
    @walls.each do |wall|
      wall.draw
    end
  end

  def has_wall given_wall_orientation
    puts "has_wall: #{@wall_orientations.one? { |wall_orientation| wall_orientation == given_wall_orientation}}"
    return true if @wall_orientations.one? { |wall_orientation| wall_orientation == given_wall_orientation}
  end
end
