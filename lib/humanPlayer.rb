require_relative "player"
require_relative "cursor"

class HumanPlayer < Player

  def make_move
    start_pos = selected_position
    end_pos = selected_position
    [start_pos, end_pos]
  end  

  private 
  def selected_position
    cursor_position = nil
    while !cursor_position 
      cursor_position = display.cursor.get_input
      system "clear"
      display.render
    end
    cursor_position
  end

end