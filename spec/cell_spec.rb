require_relative '../lib/cell'

describe Cell do

  describe "#neighbor" do

    context 'when one cell its adyacent to another in the same row' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(1, 2)
      end

      it 'is its neighbor' do
        expect(@cell_02.neighbor?(@cell_01)).to be true
      end
    end

    context 'when one cell its adyacent to another in the same column' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(2, 1)
      end

      it 'is its neighbor' do
        expect(@cell_02.neighbor?(@cell_01)).to be true
      end
    end

    context 'when one cell its adyacent to another in diagonal' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(2, 2)
      end

      it 'is its neighbor' do
        expect(@cell_02.neighbor?(@cell_01)).to be true
      end
    end

    context 'when one cell its not adyacent to another' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(3, 3)
      end

      it 'is not its neighbor' do
        expect(@cell_02.neighbor?(@cell_01)).to be false
      end
    end

  end

  describe "#==" do
    context 'when two cells have the same position' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(1, 1)
      end

      it 'theyre equal' do
        expect(@cell_01 == @cell_02)
      end
    end

    context 'when two cells havent got the same position' do
      before do
        @cell_01 = Cell.new(1, 1)
        @cell_02 = Cell.new(1, 2)
      end
      it 'theyre not equal' do
        expect(@cell_01 == @cell_02).to be false
      end
    end
  end

  describe "#adjacents" do
    context 'when a cell is asked for its adjacents' do
      before do
        @cell_01 = Cell.new(10, 10)
      end

      it 'returns a list with its 8 adjacents' do
        expect(@cell_01.adjacents.size).to eql 8
      end

      it 'every adjacent is different to eachother' do
        expect(@cell_01.adjacents).to match_array(@cell_01.adjacents.uniq)
      end
    end
  end
end