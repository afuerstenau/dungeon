require 'logger'

class Wall

  def initialize (x, y, wall_orientation)
    @x = x
    @y = y
    if (wall_orientation == :North) then
      @image=Gosu::Image.new("media/Wall_Horizontal_90.png")
    elsif (wall_orientation == :South) then
      @image=Gosu::Image.new("media/Wall_Horizontal_90.png")
      
      @y=@y+110
    elsif (wall_orientation == :West) then
      @image=Gosu::Image.new("media/Wall_Vertical.png")
      @y=@y+10
    else
      @image=Gosu::Image.new("media/Wall_Vertical.png")
      @x=@x+80
      @y=@y+10
    end
  end

  def draw
      @image.draw(@x,@y,1)
  end

end
