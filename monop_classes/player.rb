class Player
  attr_accessor :name, :money, :position, :owned_prop

  def initialize(name)
    @name = name
    @money = 16
    @position = 0
    @owned_prop = []
  end

  def to_s
    return "#{@name} has $#{@money} and owns #{@owned_prop.count} properties."
  end

end