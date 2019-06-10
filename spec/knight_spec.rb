require "rspec"
require "knight"
require "board"


describe Knight do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redKnightOnFreshBoard) { freshBoard[[0,1]] }
	let(:blueKnightOnFreshBoard) { freshBoard[[7,1]] }
	let(:queenOnEmptyBoard) { Queen.new(:red, emptyBoard, [3,3]) }

	describe "#valid_moves" do

		it "red Knight hop over other pieces other red pieces" do
			expect(redKnightOnFreshBoard.valid_moves).to match_array([[2,0],[2,2]])
		end	

		it "blue Knight hop over other pieces other red pieces" do
			expect(blueKnightOnFreshBoard.valid_moves).to match_array([[5,0],[5,2]])
		end
		
	end

	describe "#symbol" do
		it "red Knight symbol" do
			expect(redKnightOnFreshBoard.symbol).to eq('♘'.colorize(:red))
		end	
		it "blue Queen symbol" do
			expect(blueKnightOnFreshBoard.symbol).to eq('♘'.colorize(:blue))
		end			
	end

end

