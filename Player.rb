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
    @x = @x + 100 unless @x >=110
    logger.debug "after move_east x= #{@x}"
  end

  def move_west
    @x = @x - 100 if (@x - 100 > 0)
  end

  def move_north
    @y = @y - 100 if (@y - 100 > 0)
  end

  def move_south
    @y = @y + 100 if (@y + 100 < 1280-195)
  end

  def draw
    @image.draw(@x, @y, 1)
  end

end
