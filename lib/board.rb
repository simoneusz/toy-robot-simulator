# frozen_string_literal: true

# Board class creates imaginary board and check if given position within this board
class Board
  def initialize(width = 5, height = 6)
    @width = width
    @height = height
  end

  def within_bounds?(x_position, y_position)
    x_position.between?(0, @width - 1) && y_position.between?(0, @height - 1)
  end
end
