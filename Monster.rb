class Monster
  def initialize
    @image = Gosu::Image.new("media/monster.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = 100
    @y = 110
    @hitpoints = 10
  end

  def hitpoints
    @hitpoints
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
  
  def receive_hit(hit)
    if hit < @hitpoints
      @hitpoints -= hit
    elsif
      @hitpoints = 0
    end
  end
end
