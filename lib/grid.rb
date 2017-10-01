require_relative '../lib/game_of_life'
require_relative '../lib/cell'
require 'colorize'

class Grid

  def print_results(game_of_life)
    board_layout = Array.new(10).map { |_row| Array.new(10, "|_|".bold.yellow) }
    game_of_life.live_cells.each do |c|
      board_layout[c.row][c.column] = "|X|".bold.blue
    end

    row_label = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    column_label = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    print "\t"
    print row_label.join("\t")
    puts
    board_layout.each_with_index do |row, i|
      print column_label[i]
      print "\t"
      print row.join("\t")
      puts
    end
  end

end