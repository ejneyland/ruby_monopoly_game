class Tile
  attr_accessor :name, :value, :type, :colour, :owner, :occup_players

  # by passing tile_data as an argument, class attributes are able to be located and initialized
  # from the key-value pairs of objects in the board.json
  def initialize(tile_data)
    @name = tile_data["name"] # searches tile_data objects for the ["key"] value
    @value = calc_value(tile_data) # labeled value, not price, for better readability / usability 
    @type = tile_data["type"]
    @colour = tile_data["colour"]
    @owner = []
    @occup_players = []
  end

  def to_s
    case type
    when "property"
      Rainbow("#{name}, #{colour} #{type.capitalize}, Value: $#{value}").orange
    when "go"
      Rainbow("#{name}, Value: $#{value}").green
    end  
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