require_relative "piece"
require "colorize"

class Pawn < Piece

  def symbol
    '♙'.colorize(color)
  end

  def moves
    moves = []
    move_dirs_forward.each do |dx, dy|
      moves.concat(forward_moves(dx, dy))
    end
    move_dirs_side.each do |dx, dy|
      moves.concat(attack_moves(dx,dy))
    end
    moves
  end
  
  protected
  def move_dirs_forward
    self.color == :blue ? [[-1,0], [-2,0]] : [[1,0], [2,0]]
  end

  protected
  def move_dirs_side
    self.color == :blue ? [[-1,1], [-1,-1]] : [[1,-1], [1,1]]
  end

  private
  def forward_moves(dx, dy)
    moves = []
    x, y = self.position
    x, y = x+dx, y+dy
    new_position = [x, y]
    if dx.abs != 2
      if @board.empty?(new_position) && @board.valid_pos?(new_position)
        moves << new_position
        position = new_position
      end
    else
      if @board.empty?(new_position) && (self.position[0] == 1 || self.position[0] == 6)
        moves << new_position
        position = new_position
      end
    end
    moves
  end

  private
  def attack_moves(dx, dy)
    moves = []
    x, y = self.position
    x, y = x+dx, y+dy
    position = [x, y]
    if @board.valid_pos?(position)
	    if @board[position].color != self.color && !@board.empty?(position)
        moves << position
      end
    end
    moves
  end

  
end
