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
		it "red pawn in first row on empty board can take 1 or 2 steps forward" do
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[2,1],[3,1]])
		end

		it "red pawn in first row on fresh board can take 1 or 2 steps forward" do
			expect(redPawnOnFreshBoard.valid_moves).to match_array([[2,1],[3,1]])
		end

		it "blue pawn in first row on empty board can take 1 or 2 steps forward" do
			pawnOnEmptyBoard.color = :blue
			pawnOnEmptyBoard.position = [6,1]
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[5,1],[4,1]])
		end

		it "blue pawn in first row on fresh board can take 1 or 2 steps forward" do
			expect(bluePawnOnFreshBoard.valid_moves).to match_array([[5,1],[4,1]])
		end

		it "blue pawn not in first row on empty board can take only 1 step forward" do
			pawnOnEmptyBoard.color = :blue
			pawnOnEmptyBoard.position = [5,1]
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[4,1]])
		end

		it "blue pawn not in first row on fresh board can take only 1 step forward" do
			bluePawnOnFreshBoard.position = [5,1]
			expect(bluePawnOnFreshBoard.valid_moves).to match_array([[4,1]])
		end		
		
	end

end

