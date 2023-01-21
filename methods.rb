require 'tty-prompt'
require 'rainbow'

def title
  puts Rainbow('--------------------').white
  puts Rainbow('$$ WOVEN MONOPOLY $$').green
  puts Rainbow('--------------------').red
end

def who_wins
  puts Rainbow("Who are you putting YOUR money on?").blue
  response = gets.chomp.capitalize()
  puts Rainbow("Let's see, shall we! ...").green
end