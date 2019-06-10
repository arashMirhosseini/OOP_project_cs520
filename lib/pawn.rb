require_relative "piece"
require "colorize"

class Pawn < Piece

  def symbol
    '♙'.colorize(color)
  end

  def moves
    moves = []
    legal_forward_moves.each do |dx, dy|
      moves.concat(try_forward_move(dx, dy))
    end
    legal_attack_moves.each do |dx, dy|
      moves.concat(try_attack_move(dx,dy))
    end
    moves
  end
  
  def start_row?
	self.color == :blue ? self.position[0] == 6 : self.position[0] == 1
  end
  
  def promotion_row?
	self.color == :blue ? self.position[0] == 0 : self.position[0] == 7
  end  
  
  private

  def legal_forward_moves
    self.color == :blue ? [[-1,0], [-2,0]] : [[1,0], [2,0]]
  end

  def legal_attack_moves
    self.color == :blue ? [[-1,1], [-1,-1]] : [[1,-1], [1,1]]
  end

  def try_forward_move(dx, dy)
    moves = []
    new_position = self.position.zip([dx,dy]).map(&:sum)
    if dx.abs != 2 && @board.empty?(new_position) && @board.valid_pos?(new_position)
      moves << new_position
      position = new_position
    end
    moves
  end

  def try_attack_move(dx, dy)
    moves = []
    new_position = self.position.zip([dx,dy]).map(&:sum)
    if @board.valid_pos?(new_position)
	    if @board[new_position].color != self.color && !@board.empty?(new_position)
        moves << new_position
      end
    end
    moves
  end
	
end
