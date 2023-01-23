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

# pairing each dice roll with the sequential player order
GameTurn = Struct.new(:player, :dice_roll)
game_turns = []

# game script
def play_game(board, game_num, players, game_turns)
  game_num.each do |roll|
    # take first player from array
    player = players.shift
    turn = GameTurn.new(player, roll)
    last_tile_index = board.no_of_tiles - 1

    # determines a player's position on board following dice roll
    if player.position + roll <= last_tile_index # less than / equal to 8
      player.position += roll
    elsif player.position + roll > last_tile_index # greater than 8
      player.position = (player.position + roll) % board.no_of_tiles
    else
      raise "Unknown tile position"
    end
    
    current_tile = board.tiles[player.position]

    # declares each players turn: dice roll, new position, tile name
    puts "#{player.name} rolled a #{roll} and moved to tile #{player.position}, #{board.tiles[player.position].name}"
    # declares whether a property was bought or rented
    board.buy_or_rent(current_tile, player)

    if player.money <= 0 # checking players money balance
      player.bankrupt = true # declaring a bankrupt player
      board.bankrupt_players << player
      board.winner = true # declaring a winner
      break # ending the loop
    end

    # re-queue player at end of array
    players.push(player)
    game_turns.push(turn)
  end
  puts "----------------------------------------"
  # declaration of winner and the first bankrupt player
  winner = players.max_by(&:money)
  loser = board.bankrupt_players[0]
  puts Rainbow("#{loser.name} went bankrupt, owning #{loser.owned_prop.count} properties, so...").red
  puts Rainbow("The winner is #{winner.name}!").green
end

prompt = TTY::Prompt.new

title
# main menu of command line application
choices = [
  {name: "View Board", value: 1},
  {name: "Play Game 1", value: 2},
  {name: "Play Game 2", value: 3},
  {name: "Exit", value: 4}
]
selection = prompt.select("Please select an option..", choices)

case selection
when 1 # view the tiles of the Woven Monopoly board
  puts board
  puts board.tiles
when 2 # plays game 1
  who_wins(players)
  play_game(board, game_one, players, game_turns)
  puts players
when 3 # plays game 2
  who_wins(players)
  play_game(board, game_two, players, game_turns)
  puts players
when 4 # exits the application 
  puts Rainbow("exiting application...").yellow
end