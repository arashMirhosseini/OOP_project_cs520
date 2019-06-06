require "game"
require "humanPlayer"
require "display"
require "board"

describe "game" do
  # let(:board) { Board.new }
  # let(:display) { Display.new board }
  # let(:player1) { HumanPlayer.new :blue, display }
  # let(:player2) { HumanPlayer.new :red, display }
  let(:game) { Game.new }
  it "should swap turn between players" do 
    curr_player = player1
    game.swap_turn!
    expect(game.curr_player).to eq(player2)
  end
  
end