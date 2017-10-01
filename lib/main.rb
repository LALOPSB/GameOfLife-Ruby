require_relative '../lib/game_of_life'
require_relative '../lib/grid'
require_relative '../lib/cell'

@game_of_life = GameOfLife.new
@grid = Grid.new

@game_of_life.live_cells = [Cell.new(1,5), Cell.new(1,6), Cell.new(1,7)]

@grid.print_results(@game_of_life)
@game_of_life.tick
@grid.print_results(@game_of_life)