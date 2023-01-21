class Board
  
  attr_reader :tiles

  def initialize(tiles)
    @tiles = tiles
    @players = players
  end

  def to_s
    "This monopoly board contains #{@tiles.count} tiles"
  end

end