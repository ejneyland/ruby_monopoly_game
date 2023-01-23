class Board
  
  attr_accessor :name, :tiles, :players, :current_player, :bankrupt_players

  def initialize(name, tiles)
    @name = name
    @tiles = tiles
    @no_of_tiles = @tiles.length
    @players = []
    @bankrupt_players = []
  end

  def to_s
    puts Rainbow("This #{@name} board contains #{@tiles.count} tiles").orange
    @tiles.each do |tile|
      type = tile.type
      case type
      when "property"
        puts "#{tile.name}, #{tile.colour} #{type.capitalize}, Value: $#{tile.value}"
      when "go"
        puts "#{tile.name}, value: $#{tile.value}"
      end
    end  
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