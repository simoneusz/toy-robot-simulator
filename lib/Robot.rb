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

  def place(x, y, facing)
    return unless @board.within_bounds?(x, y) && DIRECTIONS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    @placed = true
  end

  def move(x, y)
    new_x = @x
    new_y = @y

    case @facing
    when 'NORTH' then new_y + 1
    when 'SOUTH' then new_y - 1
    when 'EAST'  then new_x + 1
    when 'WEST'  then new_x - 1
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

    puts "#{@x},#{@y},#{@facing}"
  end
end
