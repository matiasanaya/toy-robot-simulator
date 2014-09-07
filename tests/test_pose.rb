require './lib/toy_robot_simulator/pose'
require './tests/test_reporter_interface'
require 'minitest/autorun'

class PoseTest < MiniTest::Unit::TestCase
  include ReporterInterfaceTest

  def setup
    @x = 0
    @y = 0
    @orientation = Pose::Orientation::EAST
    @pose = @object = Pose.new(x: @x, y: @y, orientation: @orientation)
  end

  def test_that_adjacent_returns_a_pose
    assert_instance_of Pose, @pose.adjacent
  end

  def test_that_adjacent_pose_is_not_the_reciever
    refute_equal @pose, @pose.adjacent
  end

  def test_that_knows_adjacent_when_facing_east
    adjacent_pose_hash = {x: @x + 1, y: @y, orientation: @orientation}

    assert_pose adjacent_pose_hash, @pose.adjacent
  end

  def test_that_knows_adjacent_when_facing_north
    orientation = Pose::Orientation::NORTH
    @pose.send(:orientation=, orientation)
    adjacent_pose_hash = {x: @x, y: @y + 1, orientation: orientation}

    assert_pose adjacent_pose_hash, @pose.adjacent
  end

  def test_that_knows_adjacent_when_facing_west
    orientation = Pose::Orientation::WEST
    @pose.send(:orientation=, orientation)
    adjacent_pose_hash = {x: @x - 1, y: @y, orientation: orientation}

    assert_pose adjacent_pose_hash, @pose.adjacent
  end

  def test_that_knows_adjacent_when_facing_south
    orientation = Pose::Orientation::SOUTH
    @pose.send(:orientation=, orientation)
    adjacent_pose_hash = {x: @x, y: @y - 1, orientation: orientation}

    assert_pose adjacent_pose_hash, @pose.adjacent
  end

  def test_that_rotating_return_the_reciever
    assert_equal @pose, @pose.rotate!(90)
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
      @pose.send(:orientation=, initial_orientation)
      rotated_pose_hash = {x: @x, y: @y, orientation: rotated_orientation}

      assert_pose rotated_pose_hash, @pose.rotate!(90)
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
      @pose.send(:orientation=, initial_orientation)
      rotated_pose_hash = {x: @x, y: @y, orientation: rotated_orientation}

      assert_pose rotated_pose_hash, @pose.rotate!(-90)
    end
  end

  def test_that_it_reports_x
    assert_includes @pose.report, :x
  end

  def test_that_it_reports_y
    assert_includes @pose.report, :y
  end

  def test_that_it_reports_orientation
    assert_includes @pose.report, :orientation
  end

  def assert_pose(expected_pose_hash, actual)
    assert_equal expected_pose_hash[:x], actual.send(:x), ':x coordinate is different'
    assert_equal expected_pose_hash[:y], actual.send(:y), ':y coordinate is different'
    assert_equal expected_pose_hash[:orientation], actual.send(:orientation), ':orientation is different'
  end
end
