class Player
  attr_accessor :name, :money, :owned_prop, :position, :bankrupt

  def initialize(name)
    @name = name
    @money = 16
    @owned_prop = []
    @position = 0 # starting on the GO tile at index = 0
    @bankrupt = false
  end

  def to_s
    return "#{@name} has $#{@money} and owns #{@owned_prop.count} properties."
  end

end
