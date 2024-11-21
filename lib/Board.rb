class Board
  attr_reader :board

  def initialize(width = 5, height = 6)
    @width = width
    @height = height
  end

  def within_bounds?(x, y)
    x.between?(0, @width - 1) && y.between?(0, @height - 1)
  end
end
