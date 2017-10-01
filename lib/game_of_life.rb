require_relative '../lib/cell'

class GameOfLife
  def initialize
    @live_cells = []
  end

  attr_accessor :live_cells

  def add_live_cell(cell)
    @live_cells.push(cell) unless @live_cells.include?(cell)
  end

  def tick
    @kept_alive_cells = @live_cells.select { |c| should_be_kept_alive(c) }
    @bring_to_life_cells = should_be_brought_to_life
    @live_cells = @kept_alive_cells.concat(@bring_to_life_cells).uniq
  end

  def should_be_kept_alive(cell)
    number_of_neighbors(cell) == 2 || number_of_neighbors(cell) == 3
  end

  def should_be_brought_to_life
    all_adjacents_of_live_cells.select {|c| number_of_neighbors(c)==3}
  end

  def number_of_neighbors(cell)
    (@live_cells.select {|c| cell.neighbor?(c)}).size
  end

  def all_adjacents_of_live_cells
    @live_cells.inject([]){|adj, c| adj.concat(c.adjacents)}.uniq
  end

end