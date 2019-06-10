require "rspec"
require "queen"
require "board"


describe Queen do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redQueenOnFreshBoard) { freshBoard[[0,3]] }
	let(:blueQueenOnFreshBoard) { freshBoard[[7,3]] }
	let(:queenOnEmptyBoard) { Queen.new(:red, emptyBoard, [3,3]) }

	describe "#valid_moves" do

		it "red Queen can't move if its blocked by red pieces" do
			expect(redQueenOnFreshBoard.valid_moves).to match_array([])
		end	

		it "blue Queen can't move if its blocked by blue pieces" do
			expect(blueQueenOnFreshBoard.valid_moves).to match_array([])
		end
		
	end

	describe "#symbol" do
		it "red pawn symbol" do
			expect(redQueenOnFreshBoard.symbol).to eq('♕'.colorize(:red))
		end	
		it "blue pawn symbol" do
			expect(blueQueenOnFreshBoard.symbol).to eq('♕'.colorize(:blue))
		end			
	end

end

