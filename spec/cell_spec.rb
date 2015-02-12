require 'cell'

describe Cell do
	
	let(:cell){Cell.new}
	let(:ship){double :ship}

	it "can have content" do
		cell.content = ship
		expect(cell.content).to eq ship
	end
end