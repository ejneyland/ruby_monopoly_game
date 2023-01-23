class Tile
  attr_accessor :name, :value, :type, :colour

  def initialize(tile_data)
    @name = tile_data["name"]
    @value = calc_value(tile_data)
    @type = tile_data["type"]
    @colour = tile_data["colour"]
    @owner = []
    occup_players = []
  end


  def enter(player, action)
  end

  private

  def calc_value(tile_data)
    type = tile_data["type"]

    case type
    when "property"
      tile_data["price"]
    when "go"
      1
    else
      raise "Unexpected Tile type"
    end
  end
end