require "rspec"
require "pawn"
require "board"


describe Pawn do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redPawnOnFreshBoard) { freshBoard[[1,1]] }
	let(:bluePawnOnFreshBoard) { freshBoard[[6,1]] }
	let(:pawnOnEmptyBoard) { Pawn.new(:red, emptyBoard, [1,1]) }

	describe "#valid_moves" do
		it "red pawn at [1,1] on empty board should be [2,1],[3,1],[2,2],[2,0]" do
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[2,1],[3,1],[2,2],[2,0]])
		end

		it "red pawn at [1,1] on fresh board should be [2,1],[3,1],[2,2],[2,0]" do
			expect(redPawnOnFreshBoard.valid_moves).to match_array([[2,1],[3,1],[2,2],[2,0]])
		end

		it "blue pawn at [6,1] on empty board should be [5,1],[4,1],[5,2],[5,0]" do
			pawnOnEmptyBoard.color = :blue
			pawnOnEmptyBoard.position = [6,1]
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[5,1],[4,1],[5,2],[5,0]])
		end

		it "blue pawn at [6,1] on fresh board should be [5,1],[4,1],[5,2],[5,0]" do
			expect(bluePawnOnFreshBoard.valid_moves).to match_array([[5,1],[4,1],[5,2],[5,0]])
		end
		
		
	end

end

