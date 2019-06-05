require "rspec"
require "pawn"
require "board"


describe Pawn do
	let(:redPawn) { Pawn.new(:red,Board.new(false),[1,1]) }

	describe "#move_forward_not_blocked" do
		it "red pawn at [1,1] on fresh should be allowed to move forward" do
			expect(redPawn.move_forward_not_blocked(2,0)).to eq([[3,1]])
		end
	end
end

