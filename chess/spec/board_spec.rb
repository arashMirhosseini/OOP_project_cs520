require "rspec"
require "board"


describe "board class" do
  let(:board) { Board.new }
  describe "initialize method" do
    
    it "should be an instance of Board" do
      expect(board.kind_of?(Board)).to be(true)
    end
    
    it "should place all the peices at their initial position" do
      expect(board.rows[0][0].kind_of?(Rook)).to be(true)
    end

  end
end