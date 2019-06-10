module SlidingPiece
  
  def moves
    # array of places that a piece can move to
    moves = []
    legal_moves.each do |dx ,dy|
      moves.concat(try_sliding_move(dx, dy))
    end
    moves
  end

  def legal_moves
    # subclass implements this
    raise NotImplementedError
  end

  private
  def try_sliding_move(dx, dy)
    moves = []
    current_position = self.position 	
    loop do
	    new_position = current_position.zip([dx,dy]).map(&:sum)
      current_position = new_position
      break if !@board.valid_pos?(current_position)
      break if !slidable_position?(current_position)
      moves << current_position

    end
    moves
  end

  def slidable_position?(current_position)
    board.empty?(current_position) || 
      color != @board[current_position].color
  end

end