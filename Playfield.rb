require_relative 'Field'

class Playfield
  def initialize
    @field_nw = Field.new(0 , 0,[:North, :West])
    @field_sw = Field.new(0, 1,[:South, :West])
    @field_ne = Field.new(1, 0,[:North, :East])
    @field_se = Field.new(1, 1,[:South, :East])
  end

  def draw
    @field_nw.draw
    @field_sw.draw
    @field_ne.draw
    @field_se.draw
  end

end
