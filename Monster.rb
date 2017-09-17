class Monster
  attr_reader :x, :y
  
  def initialize playground_width, playground_height
    @image = Gosu::Image.new("media/monster.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = Random.rand(0..playground_width)
    @y = Random.rand(0..playground_height)
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
  
  def move_towards_player player
    if @x - player.x > 1 or (@x - player.x > 0 and (player.y-@y).abs > 0)
      @x-=1 
    elsif player.x-@x > 1 or (player.x-@x > 0 and (player.y-@y).abs > 0)
      @x+=1 
    elsif player.y-@y > 1 or (player.y-@y > 0 and (player.x-@x).abs > 0)
      @y+=1
    elsif @y-player.y > 1 or (@y-player.y > 0 and (player.x-@x).abs > 0)
      @y-=1
    else
      attack player  
    end
  end
end
