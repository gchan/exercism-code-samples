class Robot
  ORIENTATIONS = %i(north east south west)
  attr_reader :bearing

  def orient(bearing)
    raise ArgumentError unless ORIENTATIONS.include?(bearing)
    @bearing = bearing
  end

  def turn_right
    @bearing = ORIENTATIONS[(ORIENTATIONS.index(bearing) + 1) % 4]
  end

  def turn_left
    @bearing = ORIENTATIONS[(ORIENTATIONS.index(bearing) - 1) % 4]
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    case bearing
    when :north
      @y += 1
    when :south
      @y -= 1
    when :east
      @x += 1
    when :west
      @x -= 1
    end
  end
end

class Simulator
  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }

  def instructions(commands)
    commands.chars.map { |instruciton| INSTRUCTIONS[instruciton] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions(commands).each do |instruciton|
      robot.send(instruciton)
    end
  end
end
