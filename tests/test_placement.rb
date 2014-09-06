require './lib/toy_robot_simulator/placement.rb'
require 'minitest/autorun'

class PlacementTest < MiniTest::Unit::TestCase
  def setup
    @board = Object.new
    @pose = Object.new
    @placement = Placement.new(board: @board, pose: @pose)
  end

  def test_that_it_updates!
    @board.define_singleton_method(:valid_pose?) { |_| true }
    new_pose = Object.new
    assert_equal new_pose, @placement.update!(new_pose)
  end

  def test_that_update_fails
    @board.define_singleton_method(:valid_pose?) { |_| false }
    new_pose = Object.new
    assert_equal @pose, @placement.update!(new_pose)
  end

  def test_that_might_have_adjacent
    adjacent_pose = Object.new
    @board.define_singleton_method(:valid_pose?) { |_| true }
    @pose.define_singleton_method(:adjacent) { adjacent_pose }

    assert_equal @placement.send('board'), @placement.adjacent.send('board')
    assert_equal adjacent_pose, @placement.adjacent.send('pose')
  end

  def test_that_might_not_have_adjacent
    @board.define_singleton_method(:valid_pose?) { |_| false }
    @pose.define_singleton_method(:adjacent) { nil }

    assert_equal @placement, @placement.adjacent
  end

  def test_that_it_delegates_rotation
    @pose = MiniTest::Mock.new
    @placement = Placement.new(board: @board, pose: @pose)
    _ = nil

    @pose.expect(:rotate!, nil, [_])
    @placement.rotate!(_)
    @pose.verify
  end

  def test_that_it_delegates_reporting
    @pose = MiniTest::Mock.new
    @placement = Placement.new(board: @board, pose: @pose)

    @pose.expect(:report, nil)
    @placement.report
    @pose.verify
  end
end
