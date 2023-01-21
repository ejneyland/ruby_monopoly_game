class Board
  
  attr_reader :tiles, :go, :property

  def initialize(tiles)
    @go = []
    @property = []
    @tiles = @go + @property
  end

end

# go = [0]
# property = (1..8).to_a
# tiles = go + property

# puts tiles