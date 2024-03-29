require "colorize"

class Piece
  attr_accessor :color, :position, :board
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
    board.add_piece(self, position)
  end

  def symbol
    # subclass implements this
    raise NotImplementedError  
  end

  def valid_moves
    self.moves.reject {|end_pos| possible_check?(end_pos)}
  end

  private
  def possible_check?(end_pos)
    new_board = @board.dup
    new_board.move_piece!(position, end_pos)
    new_board.in_check?(color)
  end

end