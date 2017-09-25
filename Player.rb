require_relative 'Point'
require_relative 'Text_Input_Reader'

class Player
  attr_reader :x, :y
  include Text_Input_Reader

  def initialize playfield, playfield_width, playfield_height, monster, text_displayer
    @playfield = playfield
    @playfield_width = playfield_width
    @playfield_height = playfield_height
    @monster = monster

    @image = Gosu::Image.new("media/hero.png")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = @y = 0
    @hitpoints = 30
    @logger = Logger.new(STDOUT)
    @font = Gosu::Font.new(20)
    @is_attacking = false
    @text_displayer = text_displayer
  end

  def hitpoints
    @hitpoints
  end

  def attack
    if !is_dead
      if within_range(@monster)
        @is_attacking = true
        @text_displayer.display_text "Angriff Spieler 5+3?", self
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

  def button_down(id)
    puts "button down"
    if id == Gosu::KbRight
      move_east
    elsif id == Gosu::KbLeft
      move_west
    elsif id == Gosu::KbUp
      move_north
    elsif id == Gosu::KbDown
      move_south
    elsif id == Gosu::KbA
      attack
    else
      #puts "unknown id: #{id}"
      #puts "char: #{Gosu::button_id_to_char(id)}"
    end
  end

  def handle_text_input text_from_input
    if text_from_input.to_i == 8
      @monster.receive_hit 10, self
    end
  end

  def receive_hit(hit, monster)
    if hit < @hitpoints
      @hitpoints -= hit
    else
      @hitpoints = 0
    end
  end

  def is_dead
    @hitpoints <= 0
  end

end
