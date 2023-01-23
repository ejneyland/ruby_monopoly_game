require_relative './methods'
require_relative './monop_classes/board'
require_relative './monop_classes/tile'
require_relative './monop_classes/player'

require 'json'
require 'rainbow'
require 'tty-prompt'

# loading monopoly board from board.json
file = File.read('./board.json')
tiles_data = JSON.parse(file) # 1 go tile, 8 properties
tiles = tiles_data.map { |tile_data| Tile.new(tile_data) }
board = Board.new("Woven Monopoly", tiles)

# loading dice rolls for game one
file_one = File.read('./rolls_1.json')
game_one = JSON.parse(file_one) # array of numbers 1-6

# loading dice rolls for game two
file_two = File.read('./rolls_2.json')
game_two = JSON.parse(file_two) # array of numbers 1-6

# creating each player
players = [
  peter = Player.new("Peter"),
  billy = Player.new("Billy"),
  charlotte = Player.new("Charlotte"),
  sweedal = Player.new("Sweedal")
]

GameTurn = Struct.new(:player, :dice_roll)
game_turns = []

def play_game(board, game_num, players, game_turns)
  game_num.each do |roll|
    # take first player from array
    player = players.shift
    turn = GameTurn.new(player, roll)
    last_tile_index = board.no_of_tiles - 1

    if player.position + roll <= last_tile_index # less than / equal to 8
      player.position += roll
    elsif player.position + roll > last_tile_index # greater than 8
      player.position = (player.position + roll) % board.no_of_tiles
    else
      raise "Unknown tile position"
    end
    
    puts "#{player.name} rolled a #{roll} and moved to tile #{player.position}"
    # re-queue player at end of array
    players.push(player)
    game_turns.push(turn)
  end
  puts "----------------------------------------"
end

prompt = TTY::Prompt.new

title

choices = [
  {name: "View Board", value: 1},
  {name: "Play Game 1", value: 2},
  {name: "Play Game 2", value: 3},
  {name: "Exit", value: 4}
]
selection = prompt.select("Please select an option..", choices)

case selection
when 1
  puts board
  puts board.tiles
when 2
  who_wins(players)
  play_game(board, game_one, players, game_turns)
  puts players
when 3
  who_wins(players)
  play_game(board, game_two, players, game_turns)
  puts players
when 4
  puts Rainbow("exiting application...").yellow
end