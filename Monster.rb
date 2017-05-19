class Monster
  attr_reader :x, :y
  
  def initialize
    @image = Gosu::Image.new("media/monster.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = Random.rand(0..1)
    @y = Random.rand(0..1)
    @hitpoints = 20
  end

  def hitpoints
    @hitpoints
  end
  
  def draw
    @image.draw(@x*90+10, @y*100+10, 1) unless is_dead
  end
  
  def receive_hit(hit)
    if hit < @hitpoints
      @hitpoints -= hit
    elsif
      @hitpoints = 0
    end
  end
  
  def is_dead
    @hitpoints <= 0
  end
end
