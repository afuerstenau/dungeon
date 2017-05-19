class Player
  attr_reader :x, :y
  
  def initialize
    @image = Gosu::Image.new("media/hero.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = @y = 0
    @hitpoints = 30
    @logger = Logger.new(STDOUT)
  end

  def hitpoints
    @hitpoints
  end
  
  def attack(monster)
    if !is_dead 
      @logger.debug "within_range #{within_range(monster)}"
      if within_range(monster)
        hit = Random.rand(1..6)
        monster.receive_hit(hit, self)
      end
    end
  end
  
  def within_range (monster)
    if (@x == monster.x)
      if (@y+1 == monster.y or @y-1 == monster.y)
        return true
      end
    elsif (@y == monster.y)
      if (@x+1 == monster.x or @x-1 == monster.x)
        return true
      end
    end
  end

  def move_east
     if !is_dead 
       @x = @x + 1 unless @x = 1
     end
  end

  def move_west
    @x = @x - 1 unless @x = 0
  end

  def move_north
    @y = @y - 1 unless @y = 0
  end

  def move_south
    @y = @y + 1 unless @y = 1
  end

  def draw
    @image.draw(@x*90+10, @y*100+10, 2) unless is_dead
  end
  
  def receive_hit(hit, monster)
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
