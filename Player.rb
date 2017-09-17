require_relative 'Point'

class Player
  attr_reader :x, :y
  
  def initialize playfield, playfield_width, playfield_height
    @playfield = playfield
    @playfield_width = playfield_width
    @playfield_height = playfield_height
    
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
       @x = @x + 1 unless @x == @playfield_width or @playfield.way_between_two_fields_is_blocked Point.new(@x, @y), Point.new(@x+1, @y), :East
     end
  end

  def move_west
    @x = @x - 1 unless @x == 0 or @playfield.way_between_two_fields_is_blocked Point.new(@x, @y), Point.new(@x-1, @y), :West
  end

  def move_north
    
    @y = @y - 1 unless @y == 0 or @playfield.way_between_two_fields_is_blocked Point.new(@x, @y), Point.new(@x, @y-1), :North
  end

  def move_south
    @y = @y + 1 unless @y == @playfield_height or @playfield.way_between_two_fields_is_blocked Point.new(@x, @y), Point.new(@x, @y+1), :South
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
