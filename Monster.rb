class Monster
  def initialize
    @image = Gosu::Image.new("media/monster.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = 100
    @y = 110
    @score = 0
  end

  def score
    @score
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
end
