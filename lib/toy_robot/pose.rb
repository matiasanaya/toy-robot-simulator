require 'ostruct'

module ToyRobot
  class Pose
    module Orientation
      EAST = :east
      NORTH = :north
      WEST = :west
      SOUTH = :south
    end

    def initialize(args = {})
      @x = args[:x]
      @y = args[:y]
      @orientation = args[:orientation]
    end

    def mutate!(attrs = {})
      self.x = attrs[:x] || x
      self.y = attrs[:y] || y
      self.orientation = attrs[:orientation] || orientation
      self
    end

    def adjacent
      dup.send(:adjacent!)
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

    def [](key)
      report.send(:[], key)
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
      update_coordinate!(coordinate, by)
    end

    def decrement!(coordinate, by = -1)
      update_coordinate!(coordinate, by)
    end

    def update_coordinate!(coordinate, by)
      case coordinate
      when :x
        self.x = x + by
      when :y
        self.y = y + by
      end
    end
  end
end
