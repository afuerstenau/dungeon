require "minitest/autorun"
require_relative "Player"
require_relative "Playfield"
require_relative "Monster"
require_relative "Text_Displayer"

class Test_Player < Minitest::Test
  def setup
    playfield = Playfield.new 10, 10
    playfield_width = 10
    playfield_height = 10
    monster = Monster.new 10, 10
    text_displayer = Test_Text_Displayer.new
    @player = Player.new playfield, playfield_width, playfield_height, monster, text_displayer
  end

  def test_player_attack_monster
    @player.attack
  end
end

class Test_Text_Displayer
  include Text_Displayer
end
