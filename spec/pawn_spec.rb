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
		
		it "red pawn not in first row on empty board can take only 1 step forward" do
			pawnOnEmptyBoard.position = [2,1]
			expect(pawnOnEmptyBoard.valid_moves).to match_array([[3,1]])
		end

		it "red pawn not in first row on fresh board can take only 1 step forward" do
			redPawnOnFreshBoard.position = [2,1]
			expect(redPawnOnFreshBoard.valid_moves).to match_array([[3,1]])
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
		
		it "red pawn has attack moves when it has blue pawn across it" do
			board = redPawnOnFreshBoard.board
			board.move_piece(:blue,[6,2],[4,2])
			board.move_piece(:blue,[4,2],[3,2])
			board.move_piece(:blue,[3,2],[2,2])
			
			expect(redPawnOnFreshBoard.valid_moves).to match_array([[2,1],[3,1],[2,2]])
		end
		
		it "blue pawn has attack moves when it has red pawn across it" do
			board = bluePawnOnFreshBoard.board
			board.move_piece(:red,[1,2],[3,2])
			board.move_piece(:red,[3,2],[4,2])
			board.move_piece(:red,[4,2],[5,2])
			
			expect(bluePawnOnFreshBoard.valid_moves).to match_array([[5,1],[4,1],[5,2]])
		end		
		
	end

	describe "#symbol" do
		it "red pawn symbol" do
			expect(redPawnOnFreshBoard.symbol).to eq('♙'.colorize(:red))
		end	
		it "blue pawn symbol" do
			expect(bluePawnOnFreshBoard.symbol).to eq('♙'.colorize(:blue))
		end			
	end

end

