require "rspec"
require "King"
require "board"


describe King do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redKingOnFreshBoard) { freshBoard[[0,4]] }
	let(:blueKingOnFreshBoard) { freshBoard[[7,4]] }
	let(:KingOnEmptyBoard) { Pawn.new(:red, emptyBoard, [1,1]) }

	describe "#valid_moves" do
		it "red King can't move if its blocked by red pieces" do
			expect(redKingOnFreshBoard.valid_moves).to match_array([])
		end	

		it "blue King can't move if its blocked by blue pieces" do
			expect(blueKingOnFreshBoard.valid_moves).to match_array([])
		end
		
	end

	describe "#symbol" do
		it "red King symbol" do
			expect(redKingOnFreshBoard.symbol).to eq('♔'.colorize(:red))
		end	
		it "blue King symbol" do
			expect(blueKingOnFreshBoard.symbol).to eq('♔'.colorize(:blue))
		end			
	end

end

