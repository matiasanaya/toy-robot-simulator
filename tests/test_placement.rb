require './lib/toy_robot_simulator/placement'
require './tests/test_reporter_interface'
require 'minitest/autorun'

class PlacementTest < MiniTest::Unit::TestCase
  include ReporterInterfaceTest

  SimpleDouble = Struct.new(:stub) do
    def valid_pose?(_)
      stub.fetch(:valid_pose?)
    end

    def adjacent
      stub.fetch(:adjacent)
    end
  end

  def setup
    @board = SimpleDouble.new(valid_pose?: true)
    @pose = SimpleDouble.new
    @placement = @object = Placement.new(board: @board, pose: @pose)
  end

  def test_respond_to_public_interface
    assert_respond_to @placement, :update
    assert_respond_to @placement, :advance
    assert_respond_to @placement, :rotate
  end

  def test_that_it_might_update
    new_pose = Object.new

    @placement.update(new_pose)

    assert_equal new_pose, @placement.instance_variable_get(:@pose)
  end

  def test_that_update_might_fail
    @board[:stub] = { valid_pose?: false }

    @placement.update('invalid_pose')

    assert_equal @pose, @placement.instance_variable_get(:@pose)
  end

  def test_that_it_might_advance
    adjacent_pose = Object.new
    @pose[:stub] = { adjacent: adjacent_pose }

    @placement.advance

    assert_equal adjacent_pose, @placement.instance_variable_get(:@pose)
  end

  def test_that_it_might_not_advance
    @board[:stub] = { valid_pose?: false }
    @pose[:stub] = { adjacent: 'anything' }

    @placement.advance

    assert_equal @pose, @placement.instance_variable_get(:@pose)
  end

  def test_that_it_rotates
    pose = MiniTest::Mock.new
    placement = Placement.new(pose: pose)

    pose.expect(:rotate, nil, [123])
    placement.rotate(123)
    pose.verify
  end

  def test_that_it_reports
    pose = MiniTest::Mock.new
    placement = Placement.new(pose: pose)

    pose.expect(:report, nil)
    placement.report
    pose.verify
  end
end
