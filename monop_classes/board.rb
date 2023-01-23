class Board
  
  attr_accessor :name, :tiles, :no_of_tiles, :players, :bankrupt_players

  def initialize(name, tiles)
    @name = name
    @tiles = tiles
    @no_of_tiles = @tiles.length
    @players = []
    @bankrupt_players = []
  end

  def to_s
    "This #{@name} board contains #{@tiles.count} tiles"
  end

  def bankrupt
  end

  def winner
    winner = nil
    if @bankrupt_players.count == 1
      winner = @players.max_by(&:money)
    end
    return winner
  end

end