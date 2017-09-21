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
    @last_monster_movement = Time.now.sec
    self.caption = "Dungeon Hunt"

    @playground_width = 10
    @playground_height = 10

    @playfield = Playfield.new @playground_width, @playground_height
    @monster = create_monster
    @player = Player.new @playfield, @playground_width, @playground_height, @monster, self
    @font = Gosu::Font.new(20)
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
    @player.draw
    @monster.draw
    @font.draw("Spieler Trefferpunkte #{@player.hitpoints}", 10, @playground_height*110+20, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    @font.draw("Monster Trefferpunkte:#{@monster.hitpoints}", 10, @playground_height*110+40, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    @playfield.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    else
      @player.button_down(id)
      @monster.move_towards_player(@player)
    end

  end
end

window = GameWindow.new
window.show
