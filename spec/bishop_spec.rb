require "rspec"
require "bishop"
require "board"


describe Bishop do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	
	let(:redBishopOnFreshBoard) { freshBoard[[0,2]] }
	let(:blueBishopOnFreshBoard) { freshBoard[[7,2]] }
	let(:bishopOnEmptyBoard) { Bishop.new(:red, emptyBoard, [3,3]) }


	describe "#valid_moves" do
	
		it "red Bishop can't move if its blocked by red pieces" do
			expect(redBishopOnFreshBoard.valid_moves).to match_array([])
		end	

		it "blue Bishop can't move if its blocked by blue pieces" do
			expect(blueBishopOnFreshBoard.valid_moves).to match_array([])
		end			
	
		it "red Bishop can move digonally as long as its not blocked by red pieces[Right Only]" do
			board = redBishopOnFreshBoard.board
			board.move_piece(:red,[1,3],[3,3])

			expect(redBishopOnFreshBoard.valid_moves).to match_array([[1,3],[2,4],[3,5],[4,6],[5,7]])
		end	

		it "red Bishop can move digonally as long as its not blocked by red pieces[Left Only]" do
			board = redBishopOnFreshBoard.board
			board.move_piece(:red,[1,1],[3,1])

			expect(redBishopOnFreshBoard.valid_moves).to match_array([[1,1],[2,0]])
		end	
		
		it "red Bishop can move digonally as long as its not blocked by red pieces[Left & Right]" do
			board = redBishopOnFreshBoard.board
			board.move_piece(:red,[1,1],[3,1])
			board.move_piece(:red,[1,3],[3,3])
			
			expect(redBishopOnFreshBoard.valid_moves).to match_array([[1,1],[2,0],[1,3],[2,4],[3,5],[4,6],[5,7]])
		end			

		it "blue Bishop can move digonally as long as its not blocked by red pieces[Right Only]" do
			board = blueBishopOnFreshBoard.board
			board.move_piece(:blue,[6,3],[4,3])

			expect(blueBishopOnFreshBoard.valid_moves).to match_array([[6,3],[5,4],[4,5],[3,6],[2,7]])
		end	

		it "blue Bishop can move digonally as long as its not blocked by red pieces[Left Only]" do
			board = blueBishopOnFreshBoard.board
			board.move_piece(:blue,[6,1],[4,1])

			expect(blueBishopOnFreshBoard.valid_moves).to match_array([[6,1],[5,0]])
		end	
		
		it "blue Bishop can move digonally as long as its not blocked by red pieces[Left & Right]" do
			board = blueBishopOnFreshBoard.board
			board.move_piece(:blue,[6,1],[4,1])
			board.move_piece(:blue,[6,3],[4,3])
			
			expect(blueBishopOnFreshBoard.valid_moves).to match_array([[6,1],[5,0],[6,3],[5,4],[4,5],[3,6],[2,7]])
		end		
	end

	describe "#symbol" do
		it "red pawn symbol" do
			expect(redBishopOnFreshBoard.symbol).to eq('♝'.colorize(:red))
		end	
		it "blue pawn symbol" do
			expect(blueBishopOnFreshBoard.symbol).to eq('♝'.colorize(:blue))
		end			
	end

end

