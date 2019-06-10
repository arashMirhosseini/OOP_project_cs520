require "rspec"
require "pawn"
require "board"


describe Rook do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redRookOnFreshBoard) { freshBoard[[0,0]] }
	let(:blueRookOnFreshBoard) { freshBoard[[7,0]] }
	let(:rookOnEmptyBoard) { Rook.new(:red, emptyBoard, [3,3]) }

	describe "#valid_moves" do

		it "red Rook can't move if its blocked by red pieces" do
			expect(redRookOnFreshBoard.valid_moves).to match_array([])
		end

		it "blue Rook can't move if its blocked by blue pieces" do
			expect(blueRookOnFreshBoard.valid_moves).to match_array([])
		end	


		it "red Rook can move orthogonally as long as its not blocked by red pieces[Forward Only]" do
			board = redRookOnFreshBoard.board
			board.move_piece(:red,[1,0],[3,0])

			expect(redRookOnFreshBoard.valid_moves).to match_array([[1,0],[2,0]])
		end	
		
		it "red Rook can move orthogonally as long as its not blocked by red pieces[Right Only]" do
			board = redRookOnFreshBoard.board
			board.move_piece(:red,[0,1],[2,2])
			
			expect(redRookOnFreshBoard.valid_moves).to match_array([[0,1]])
		end		

		it "red Rook can move orthogonally as long as its not blocked by red pieces[Right and Forward]" do
			board = redRookOnFreshBoard.board
			board.move_piece(:red,[1,0],[3,0])			
			board.move_piece(:red,[0,1],[2,2])
			
			expect(redRookOnFreshBoard.valid_moves).to match_array([[0,1],[1,0],[2,0]])
		end		

		it "blue Rook can move orthogonally as long as its not blocked by blue pieces[Forward Only]" do
			board = blueRookOnFreshBoard.board
			board.move_piece(:blue,[6,0],[4,0])

			expect(blueRookOnFreshBoard.valid_moves).to match_array([[6,0],[5,0]])
		end	
		
		it "blue Rook can move orthogonally as long as its not blocked by blue pieces[Right Only]" do
			board = blueRookOnFreshBoard.board
			board.move_piece(:blue,[7,1],[5,2])
			
			expect(blueRookOnFreshBoard.valid_moves).to match_array([[7,1]])
		end		

		it "blue Rook can move orthogonally as long as its not blocked by blue pieces[Right and Forward]" do
			board = blueRookOnFreshBoard.board
			board.move_piece(:blue,[6,0],[4,0])			
			board.move_piece(:blue,[7,1],[5,2])
			
			expect(blueRookOnFreshBoard.valid_moves).to match_array([[7,1],[6,0],[5,0]])
		end		

			
	end

	describe "#symbol" do
		it "red  rook symbol" do
			expect(redRookOnFreshBoard.symbol).to eq('♜'.colorize(:red))
		end	
		it "blue rook symbol" do
			expect(blueRookOnFreshBoard.symbol).to eq('♜'.colorize(:blue))
		end			
	end

end

