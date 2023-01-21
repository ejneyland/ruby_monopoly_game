class Player
  attr_accessor

  def initialize(name)
    @name = name
    @money = 16
    @position = 0
    @properties = []
  end

  def to_s
    return "#{@name} has $#{@money} and owns #{@property.count} properties."
  end

end