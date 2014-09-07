class Pose
  Pose::Orientation = Module.new
  Pose::Orientation::EAST = :east
  Pose::Orientation::NORTH = :north
  Pose::Orientation::WEST = :west
  Pose::Orientation::SOUTH = :south

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
    @orientation = args[:orientation]
  end

  def adjacent
    adjacent_pose = dup.send(:adjacent!)
  end

  def rotate!(degrees)
    step = (degrees % 90) + (degrees/degrees.abs)
    self.orientation = step_orientation(step)
    self
  end

  def report
    {
      x: x,
      y: y,
      orientation: orientation
    }
  end

  private

  attr_accessor :x, :y, :orientation

  def step_orientation(by = 1)
    orientations = [
                    Pose::Orientation::NORTH,
                    Pose::Orientation::EAST,
                    Pose::Orientation::SOUTH,
                    Pose::Orientation::WEST
                  ]

    orientations[(orientations.index(orientation) + by) % 4]
  end

  def adjacent!
    case orientation
    when Pose::Orientation::EAST
      increment!(:x)
    when Pose::Orientation::NORTH
      increment!(:y)
    when Pose::Orientation::WEST
      decrement!(:x)
    when Pose::Orientation::SOUTH
      decrement!(:y)
    end
    self
  end

  def increment!(coordinate, by = 1)
    update!(coordinate, by)
  end

  def decrement!(coordinate, by = -1)
    update!(coordinate, by)
  end

  def update!(coordinate, by)
    case coordinate
    when :x
      @x += by
    when :y
      @y += by
    end
  end
end