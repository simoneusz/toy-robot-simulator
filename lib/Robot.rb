class Robot
  attr_accessor :postiion

  DIRECTIONS = %w[NORTH SOUTH EAST WEST].freeze

  def initialize(board)
    @board = board
    @x = nil
    @y = nil
    @placed = false
    @facing = nil
  end
end
