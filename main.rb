require_relative('lib/Board')
require_relative('lib/Robot')

class RobotController
  def initialize
    @board = Board.new
    @robot = Robot.new(@board)
  end

  def start
    loop do
      input = gets.chomp
      process_command(input)
    end
  end

  def process_command(command)
    case command.split(' ')[0]
    when 'PLACE'
      directions = command.split(' ')[1].split(',')
      x = directions[0].to_i
      y = directions[1].to_i
      facing = directions[2]
      @robot.place(x, y, facing)
    when 'MOVE'
      @robot.move
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      @robot.report
    else
      puts "Invalid command: #{command}"
    end
  end
end

controller = RobotController.new
controller.start
