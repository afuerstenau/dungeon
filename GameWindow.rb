require 'gosu'
require_relative 'Player'
require_relative 'Monster'
require_relative 'Playfield'

module ZOrder
  Background, Stars, Player, UI = *0..3
end

class GameWindow < Gosu::Window
  def initialize
    super 1280, 1280
    self.caption = "Dungeon Hunt"

    #@background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @playground_width = 10
    @playground_height = 10

    @player = Player.new @playground_width, @playground_height
    @playfield = Playfield.new @playground_width, @playground_height
    @font = Gosu::Font.new(20)
    
    @monster = create_monster
  end
  
  def create_monster
    Monster.new @playground_width, @playground_height
  end

  def update
    if @monster.is_dead 
      @monster = create_monster
    end
  end

  def draw
    #@background_image.draw(0, 0, 0);
    @player.draw
    @monster.draw
    @font.draw("Spieler Trefferpunkte #{@player.hitpoints}", 10, 230, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    @font.draw("Monster Trefferpunkte:#{@monster.hitpoints}", 10, 250, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    @playfield.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    elsif id == Gosu::KbRight
      @player.move_east
    elsif id == Gosu::KbLeft
      @player.move_west
    elsif id == Gosu::KbUp
      @player.move_north
    elsif id == Gosu::KbDown
      @player.move_south
    elsif id == Gosu::KbA
      @player.attack(@monster)
    end
    
  end
end

window = GameWindow.new
window.show
