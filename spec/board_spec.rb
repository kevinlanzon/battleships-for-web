require 'board'

describe Board do
  let(:cell){double :cell, content: :water}
  let(:cell_class){double :cell_class, :new => cell }
  let(:board){Board.new({size: 10, content: cell_class})}
  let(:ship){double :ship, size: 2}
  let(:small_ship){double :ship, size: 1}

	it 'has a grid of 100' do
		expect(board.grid.count).to eq 100
	end

  it "can place a ship" do
    first_cell = double :cell
    board.grid[:A1] = first_cell
    expect(board.grid[:A1]).to receive(:content=).with small_ship
    board.place(small_ship, :A1)
  end

  it "can place a 2 cell ship horizontally" do
    second_cell = double :cell
    allow(cell).to receive(:content=)
    board.grid[:A2] = second_cell
    expect(board.grid[:A2]).to receive(:content=).with ship
    board.place(ship,:A1,:horizontally)
  end

  it "should be able to get all the coordiantes for a size and direction" do
    expect(board.get_coordinates(:A1, 3, :horizontally)).to eq [:A1, :A2, :A3]

  end



end