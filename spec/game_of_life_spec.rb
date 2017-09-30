require_relative '../lib/game_of_life'

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

    context 'when a game_of_life has ' do

    end


  end



end