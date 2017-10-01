class Cell
  def initialize(row,column)
    @row = row
    @column = column
  end

  attr_accessor :row, :column

  def neighbor? cell
    (cell.row - @row).abs <=1 && (cell.column - @column).abs <=1 && !((cell.row - @row).zero? && (cell.column - @column).zero?)
  end

  def == cell
    row == cell.row && column == cell.column
  end

  def eql? cell
    row == cell.row && column == cell.column
  end

  def hash
    row.hash ^ column.hash
  end

  def adjacents
    adjacents_aux = [[-1, 1], [0, 1], [1, 1], [-1, 0], [1, 0], [-1, -1], [0, -1], [1, -1]]
    adjacents_aux.collect {|(rowDif,columnDif)| Cell.new(row + rowDif, column + columnDif)}
  end

end