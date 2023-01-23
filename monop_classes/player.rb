class Player
  attr_accessor :name, :money, :owned_prop

  def initialize(name)
    @name = name
    @money = 16
    @owned_prop = []
  end

  def to_s
    return "#{@name} has $#{@money} and owns #{@owned_prop.count} properties."
  end


  def buy_property(tile)
    type = tile.type
    case type
    when "property"
    if @money >= tile.value && tile.owner == nil
      @money -= tile.value
      @owned_prop << tile && tile.owner == player
    end
    when "go"
      @money += tile.value
    else
      raise "Unexpected Tile Type"
    end 
  end

  def pay_rent(player, property)
    # if property is owned by any of the players
    # current player must pay property owner property.price
    # current player.money is reduced by property.price
    # property owner's player.money gains property.price  
  end

end