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
end