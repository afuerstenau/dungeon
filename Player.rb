class Player
  def initialize
    @image = Gosu::Image.new("media/hero.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = @y = 10
    @score = 0
  end

  def score
    @score
  end

  def move_east
    logger = Logger.new(STDOUT)
    logger.debug "before move_east x= #{@x}"
    @x = @x + 90 unless @x >=100
    logger.debug "after move_east x= #{@x}"
  end

  def move_west
    @x = @x - 90 if (@x - 90 > 0)
  end

  def move_north
    @y = @y - 100 if (@y - 100 > 0)
  end

  def move_south
    @y = @y + 100 unless @y >= 100
  end

  def draw
    @image.draw(@x, @y, 2)
  end

end
