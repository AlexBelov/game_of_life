#
# Conway's Game of Life in Ruby
# http://en.wikipedia.org/wiki/Conway's_Game_of_Life
# 
# Some code from this excellent article:
# http://rubyquiz.strd6.com/quizzes/193-game-of-life
#

require './lib/cell'
require './lib/game'

Game.new(100, 50, 0.1, 1000).play!
