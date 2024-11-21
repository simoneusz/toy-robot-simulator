class Robot
  attr_accessor :postiion

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(board)
    @board = board
    @x = nil
    @y = nil
    @placed = false
    @facing = nil
  end

  def place(x, y, facing)
    return unless @board.within_bounds?(x, y) && DIRECTIONS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    @placed = true
  end

  def move
    new_x = @x
    new_y = @y

    case @facing
    when 'NORTH'
      new_y += 1
    when 'SOUTH'
      new_y -= 1
    when 'EAST'
      new_x += 1
    when 'WEST'
      new_x -= 1
    end

    return unless @board.within_bounds?(new_x, new_y)

    @x = new_x
    @y = new_y
  end

  def left
    return unless @placed

    current_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS[(current_index - 1) % DIRECTIONS.size]
  end

  def right
    return unless @placed

    current_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS[(current_index + 1) % DIRECTIONS.size]
  end

  def report
    return unless @placed

    puts "\n#{@x},#{@y},#{@facing}"
  end
end
