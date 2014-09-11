require_relative '../lib/toy_robot_simulator/board'
require 'minitest/autorun'

class BoardTest < MiniTest::Unit::TestCase

  PoseDouble = Struct.new(:x, :y)

  def setup
    @board = Board.new(5,5)
  end

  def test_that_knows_a_valid_pose
    pose_double = PoseDouble.new(0,0)

    assert @board.valid_pose?(pose_double)
  end

  def test_that_knows_an_invalid_pose
    [[-1,0], [0,-1], [6,0], [0,6]].each do |out_of_range|
      pose_double = PoseDouble.new(*out_of_range)

      refute @board.valid_pose?(pose_double), "Pose #{pose_double} should be invalid"
    end
  end

  def test_that_a_nil_pose_is_invalid
    refute @board.valid_pose?(nil)
  end
end
