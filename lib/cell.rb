class Cell
  def initialize(row,column)
    @row = row
    @column = column
  end

  attr_accessor :row, :column

  def neighbor?(cell)
    (cell.row - @row).abs <=1 && (cell.column - @column).abs <=1 && !((cell.row - @row).zero? && (cell.column - @column).zero?)
  end
end