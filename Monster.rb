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
  
  def receive_hit(hit, player)
    if hit < @hitpoints
      @hitpoints -= hit
      attack(player)
    elsif
      @hitpoints = 0
    end
  end
  
  def attack(player)
    # @logger.debug "within_range #{within_range(player)}"
    if within_range(player)
      hit = Random.rand(1..6)
      player.receive_hit(hit, self)
    end
  end
  
  def within_range (player)
    if (@x == player.x)
      if (@y+1 == player.y or @y-1 == player.y)
        return true
      end
    elsif (@y == player.y)
      if (@x+1 == player.x or @x-1 == player.x)
        return true
      end
    end
  end
  
  def is_dead
    @hitpoints <= 0
  end
end
