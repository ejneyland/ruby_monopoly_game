class Property

  attr_reader :position, :name, :colour, :type
  attr_accessor :price

  def initialize
    @position = position
    @name = name
    @price = price
    @colour = colour
    @type = type
  end

end