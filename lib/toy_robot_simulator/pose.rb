class Pose
  module Orientation
    EAST = :east
    NORTH = :north
    WEST = :west
    SOUTH = :south
  end

  attr_accessor :x, :y, :orientation

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
    @orientation = args[:orientation]
  end

  def adjacent
    dup.send(:adjacent!)
  end

  def rotate!(degrees)
    step = (degrees % 90) + (degrees/degrees.abs)
    self.orientation = step_orientation(step)
  end

  def report
    {
      x: x,
      y: y,
      orientation: orientation
    }
  end

  private

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
      self.x = x + by
    when :y
      self.y = y + by
    end
  end
end
