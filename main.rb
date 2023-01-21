require_relative './methods'
require_relative './monop_classes/board'
require_relative './monop_classes/player'
require_relative './monop_classes/property'

require 'json'
require 'rainbow'
require 'tty-prompt'

# loading monopoly board from board.json
file = File.read('./board.json')
tiles = JSON.parse(file)
board = Board.new(tiles)

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

def menu
  prompt = TTY::Prompt.new
  
  choices = [
    {name: "Play Game 1", value: 1},
    {name: "Play Game 2", value: 2},
    {name: "Exit", value: 3}
  ]
  selection = prompt.select("Please select an option..", choices)
  
  case selection
  when 1
    who_wins
  when 2
    who_wins
  when 3
    puts Rainbow("exiting application...").yellow
  end

end

# title
# menu