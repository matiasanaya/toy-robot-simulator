require_relative '../lib/toy_robot/pose'
require_relative 'test_pose_interface'
require_relative 'test_reporter_interface'

require 'minitest/autorun'

module ToyRobot
  class PoseTest < MiniTest::Unit::TestCase
    include PoseInterfaceTest
    include ReporterInterfaceTest

    def setup
      @x, @y = 0, 1
      @orientation = Pose::Orientation::EAST
      @pose = @object = Pose.new(
        x: @x,
        y: @y,
        orientation: @orientation
      )
    end

    def test_it_can_be_initialized_without_arguments
      assert Pose.new
    end

    def test_that_it_can_mutate
      mutated_pose_attrs = {
        x: 5,
        y: 5,
        orientation: 'random'
      }

      assert_pose mutated_pose_attrs, @pose.mutate!(mutated_pose_attrs)
    end

    def test_that_knows_adjacent_when_facing_east
      adjacent_pose_hash = {
        x: @x + 1,
        y: @y,
        orientation: @orientation
      }

      assert_pose adjacent_pose_hash, @pose.adjacent
    end

    def test_that_knows_adjacent_when_facing_north
      orientation = Pose::Orientation::NORTH
      @pose.instance_variable_set(:@orientation, orientation)
      adjacent_pose_hash = {
        x: @x,
        y: @y + 1,
        orientation: orientation
      }

      assert_pose adjacent_pose_hash, @pose.adjacent
    end

    def test_that_knows_adjacent_when_facing_west
      orientation = Pose::Orientation::WEST
      @pose.instance_variable_set(:@orientation, orientation)
      adjacent_pose_hash = {
        x: @x - 1,
        y: @y,
        orientation: orientation
      }

      assert_pose adjacent_pose_hash, @pose.adjacent
    end

    def test_that_knows_adjacent_when_facing_south
      orientation = Pose::Orientation::SOUTH
      @pose.instance_variable_set(:@orientation, orientation)
      adjacent_pose_hash = {
        x: @x,
        y: @y - 1,
        orientation: orientation
      }

      assert_pose adjacent_pose_hash, @pose.adjacent
    end

    def test_that_can_rotate_90
      clockwise_orientations = [
        Pose::Orientation::NORTH,
        Pose::Orientation::EAST,
        Pose::Orientation::SOUTH,
        Pose::Orientation::WEST,
        Pose::Orientation::NORTH
      ]

      clockwise_orientations.each_cons(2) do |initial_orientation, rotated_orientation|
        @pose.instance_variable_set(:@orientation, initial_orientation)
        rotated_pose_hash = {x: @x, y: @y, orientation: rotated_orientation}

        @pose.rotate!(90)

        assert_pose rotated_pose_hash, @pose
      end
    end

    def test_that_can_rotate_90_counterclockwise
      counter_clockwise_orientations = [
        Pose::Orientation::NORTH,
        Pose::Orientation::WEST,
        Pose::Orientation::SOUTH,
        Pose::Orientation::EAST,
        Pose::Orientation::NORTH
      ]

      counter_clockwise_orientations.each_cons(2) do |initial_orientation, rotated_orientation|
        @pose.instance_variable_set(:@orientation, initial_orientation)
        rotated_pose_hash = {
          x: @x,
          y: @y,
          orientation: rotated_orientation
        }

        @pose.rotate!(-90)

        assert_pose rotated_pose_hash, @pose
      end
    end

    def test_that_hash_like_access_to_x_returns_instance_variable_x
      assert_equal @pose.instance_variable_get(:@x), @pose[:x]
    end

    def test_that_hash_like_access_to_y_returns_instance_variable_y
      assert_equal @pose.instance_variable_get(:@y), @pose[:y]
    end

    def test_that_hash_like_access_to_orientation_returns_instance_variable_orientation
      assert_equal @pose.instance_variable_get(:@orientation), @pose[:orientation]
    end

    def assert_pose(expected_pose_hash, actual)
      assert_equal expected_pose_hash[:x], actual.send(:x), ':x coordinate is different'
      assert_equal expected_pose_hash[:y], actual.send(:y), ':y coordinate is different'
      assert_equal expected_pose_hash[:orientation], actual.send(:orientation), ':orientation is different'
    end
  end
end
