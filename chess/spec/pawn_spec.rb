require "rspec"
require "pawn"
require "board"


describe Pawn do
	let(:freshBoard) {Board.new}
	let(:emptyBoard) {Board.new(false)}
	let(:redPawnOnFreshBoard) { freshBoard[[1,1]] }
	let(:redPawnOnEmptyBoard) { Pawn.new(:red, emptyBoard, [1,1]) }

	describe "#move_forward_not_blocked" do
		it "red pawn at [1,1] on empty board should be allowed to move forward" do
			expect(redPawnOnEmptyBoard.move_forward_not_blocked(2,0)).to eq([[3,1]])
		end
	end

	describe "#move_forward_not_blocked" do
		it "red pawn at [1,1] on empty board should not be allowd to move backword" do
			expect(redPawnOnEmptyBoard.move_forward_not_blocked(-2,0)).to eq([])
		end
	end

end

