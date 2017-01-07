require 'logger'

class Wall

  def initialize (x, y, wall_orientation)
    @x = x
    @y = y
    if (wall_orientation == :North) then
      @image=Gosu::Image.new("media/Wall_Horizontal.png")
    elsif (wall_orientation == :South) then
      @image=Gosu::Image.new("media/Wall_Horizontal.png")
      @y=@y+100
    elsif (wall_orientation == :West) then
      @image=Gosu::Image.new("media/Wall_Vertical.png")
    else
      @image=Gosu::Image.new("media/Wall_Vertical.png")
      @x=@x+100
    end
    logger = Logger.new(STDOUT)
    logger.debug "Wall with orientation #{wall_orientation} initialized: #{@image}"
  end

  def draw
      @image.draw(@x,@y,1)
  end

end
