class Board
  
  attr_accessor :name, :tiles, :no_of_tiles, :players, :bankrupt_players, :winner

  def initialize(name, tiles)
    @name = name
    @tiles = tiles
    @no_of_tiles = @tiles.length
    @players = []
    @bankrupt_players = []
    @winner = false
  end

  def to_s
    "This #{@name} board contains #{@tiles.count} tiles"
  end

  def buy_or_rent(tile, player)
    property = tile.type["property"]
    owned = tile.owner.length == 1
    case true

    when property && !owned # property and not owned, player buy property
      if player.money >= tile.value
        player.money -= tile.value
        player.owned_prop << tile && tile.owner << player
        puts Rainbow("Bought Property").green
      elsif player.money < tile.value
        puts "Couldn't afford to buy"
      end

    when property && owned # property and owned, player pays rent to property owner 
      player.money -= tile.value
      tile.owner[0].money += tile.value
      puts Rainbow("Paid Rent").yellow
       
    when tile.type["go"] # landing on GO tile earns players a dollar
      player.money += tile.value
    end 
      # future revisions will ensure each player receives a dollar for going past this tile, not just the players that land on it 

  end

end