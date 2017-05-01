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

    @player = Player.new
    @playfield = Playfield.new
    @font = Gosu::Font.new(20)
    @monster = Monster.new
  end

  def update
  end

  def draw
    #@background_image.draw(0, 0, 0);
    @player.draw
    @monster.draw
    #@font.draw("Score: #{@player.score}", 100, 100, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
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
    end
  end
end

window = GameWindow.new
window.show
