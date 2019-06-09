require_relative "piece"
require_relative "steppingPiece"
require "colorize"

class King < Piece
  include SteppingPiece

  def symbol
    '♔'.colorize(color)
  end

  protected
  def legal_moves
    [
      [-1,-1], [-1,0], [-1, 1],
      [0,-1], [0, 1],
      [1,-1], [1, 0], [1, 1]
    ]
  end
  
end