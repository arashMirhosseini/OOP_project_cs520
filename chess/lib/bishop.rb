require_relative "piece"
require_relative "slidingPiece"
require "colorize"

class Bishop < Piece
  include SlidingPiece

  def symbol
    '♝'.colorize(color)
  end
  
  private
  def legal_moves
    [[-1, -1],[1, -1],[-1, 1], [1, 1]]
  end
end