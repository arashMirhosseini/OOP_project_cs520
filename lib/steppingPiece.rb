module SteppingPiece
  
  def moves
    moves = []
    legal_moves.each do |dx, dy|
      moves.concat(try_stepping_move(dx,dy))
    end
    moves
  end

  def legal_moves
    # implemeted in the class
  end

  private
  def try_stepping_move(dx, dy)
    moves = []
	new_position = self.position.zip([dx,dy]).map(&:sum)

    if @board.valid_pos?(new_position)
      # p position
      if @board.empty?(new_position)
        moves << new_position
      else
          moves << new_position if @board[new_position].color != color
          
      end
    end
    moves
  end

end