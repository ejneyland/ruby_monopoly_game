require 'tty-prompt'
require 'rainbow'

def title
  puts Rainbow('--------------------').white
  puts Rainbow('$$ WOVEN MONOPOLY $$').green
  puts Rainbow('--------------------').red
end

def who_wins(players)
  prompt = TTY::Prompt.new
  choices = [
    {name: "#{players[0].name}", value: 1},
    {name: "#{players[1].name}", value: 2},
    {name: "#{players[2].name}", value: 3},
    {name: "#{players[3].name}", value: 4}
  ]
  selection = prompt.select(Rainbow("Who are you putting YOUR money on?").blue, choices)
  puts Rainbow("Let's see, shall we! ...").green
end