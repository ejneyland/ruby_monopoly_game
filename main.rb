require_relative './methods'
require_relative './monop_classes/tiles'
require_relative './monop_classes/player'
require_relative './monop_classes/property'

require 'json'
require 'rainbow'
require 'tty-prompt'

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

title
menu