require_relative '../lib/game_of_life'
require_relative '../lib/cell'

def add_cell_to_game(row, column)
  @lonelyCell = Cell.new(row, column)
  @game_of_life.add_live_cell(@lonelyCell)
end

describe GameOfLife do

  before :each do
    @game_of_life = GameOfLife.new
  end

  describe '#new' do
    context 'when a game_of_life is created' do
      it 'has no live_cells' do
        expect(@game_of_life.live_cells).to be_empty
      end
    end
  end

  describe '.tick' do


    context 'when a game_of_life has no live_cells' do

      before do
        @game_of_life.tick
      end

      it 'stays that way after tick' do
        expect(@game_of_life.live_cells).to be_empty
      end
    end

    context 'when theres a cell with no neighbors' do
      before do
        add_cell_to_game(1, 2)
        @game_of_life.tick
      end

      it 'gets killed after tick' do
        expect(@game_of_life.live_cells).to be_empty
      end

    end

    context 'when theres a cell with one neighbor' do
      before do
        add_cell_to_game(1, 2)
        add_cell_to_game(1, 3)
        @game_of_life.tick
      end

      it 'gets killed after tick' do
        expect(@game_of_life.live_cells).to be_empty
      end
    end

    context 'when theres a cell with just two neighbors' do
      before do
        @cell_to_live = Cell.new(2,2)
        @game_of_life.add_live_cell(@cell_to_live)
        add_cell_to_game(1, 1)
        add_cell_to_game(3, 3)
        @game_of_life.tick
      end

      it 'stays alive after tick' do
        expect(@game_of_life.live_cells).to contain_exactly(@cell_to_live)
      end
    end

    context 'when theres a cell with just three neighbors' do
      before do
        @cell_to_live = Cell.new(1,1)
        @game_of_life.add_live_cell(@cell_to_live)
        add_cell_to_game(0, 0)
        add_cell_to_game(2, 0)
        add_cell_to_game(2, 2)
        @game_of_life.tick
      end

      it 'stays alive after tick' do
        expect(@game_of_life.live_cells).to include(@cell_to_live)
      end
    end

    context 'when theres a cell with more than three neighbors' do
      before do
        @cell_to_die = Cell.new(1,1)
        @game_of_life.add_live_cell(@cell_to_die)
        add_cell_to_game(0, 0)
        add_cell_to_game(0, 2)
        add_cell_to_game(2, 0)
        add_cell_to_game(2, 2)
        @game_of_life.tick
      end

      it 'dies after tick' do
        expect(@game_of_life.live_cells).not_to include(@cell_to_die)
      end
    end

    context 'when theres a dead cell with three neighbors' do
      before do
        add_cell_to_game(0,0)
        add_cell_to_game(0,2)
        add_cell_to_game(2,0)
        @game_of_life.tick
      end

      it 'gets alive after tick' do

        expect(@game_of_life.live_cells.size).to eql 1
      end
    end

    context 'when theres a dead cell with more than three neighbors' do
      before do
        @wont_be_alive_cell = Cell.new(1,1)
        add_cell_to_game(0,0)
        add_cell_to_game(0,2)
        add_cell_to_game(2,0)
        add_cell_to_game(2,2)
        @game_of_life.tick
      end

      it 'wont get alive after tick' do
        expect(@game_of_life.live_cells).not_to include(@wont_be_alive_cell)
      end
    end

  end

  describe '#add_cell' do
    context 'when a cell is already alive' do

      before do
        add_cell_to_game(0,0)
        add_cell_to_game(0,0)
      end

      it 'cant be added to the game' do
        expect(@game_of_life.live_cells.size).to eql 1
      end
    end
  end

  describe '#all_adjacents' do
    context 'when getting two cells adjacents' do

      before do
        add_cell_to_game(0,1)
        add_cell_to_game(0,3)
      end

      it 'returns all its neighbors not repeated' do
        expect(@game_of_life.all_adjacents_of_live_cells.size).to eql 13
      end
    end
  end



end