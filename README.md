## MONOPOLY GAME, Code Test
Ethan Neyland

This document contains:
- Installation and Launch Instructions
- Introduction
- Game Rules
- Code Test outline / objectives

---

### Installation and App Launch Instructions

1. If you don't already have one, download a terminal emulator such as Visual Studio Code
   - Mac: https://code.visualstudio.com/docs/setup/mac
   - Windows: https://code.visualstudio.com/docs/setup/windows
   - Linux: https://code.visualstudio.com/docs/setup/linux 

2. Download Ruby 
   - Install instructions: https://www.ruby-lang.org/en/documentation/installation/

3. Download bundler gem
   - Install instructions: https://bundler.io 
   - Enter ```gem install bundler``` in terminal

4. Clone repository to your computer
    - Clone repository instructions: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository
    - https clone URL: https://github.com/ejneyland/ruby_monopoly_game.git

5. Install the gems used by the application
   - Enter ```bundle install``` in terminal
   - Gems installed should include: rainbow, tty-prompt, json and rspec

6. Launch the app
   - Enter ```ruby main.rb``` in terminal

---

### Introduction

Your task is to write an application to play the game of Woven Monopoly.
In Woven Monopoly, the dice rolls are set ahead of time, the game is deterministic.

### Game rules
* There are four players who take turns in the following order:
  * Peter
  * Billy
  * Charlotte
  * Sweedal
* Each player starts with $16
* Everybody starts on GO
* You get $1 when you pass GO (this excludes your starting move)
* If you land on a property, you must buy it
* If you land on an owned property, you must pay rent to the owner
* If the same owner owns all property of the same colour, the rent is doubled
* Once someone is bankrupt, whoever has the most money remaining is the winner
* There are no chance cards, jail or stations
* The board wraps around (i.e. you get to the last space, the next space is the first space)

### Code Test outline / objectives
* Load in the board from board.json
* Implement game logic as per the rules
* Load in the given dice rolls files and simulate the game
  * Who would win each game?
  * How much money does everybody end up with?
  * What spaces does everybody finish on?