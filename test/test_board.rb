require_relative '../lib/toy_robot/board'
require_relative 'test_board_interface'
require 'minitest/autorun'

module ToyRobot
  class BoardTest < MiniTest::Unit::TestCase
    include BoardInterfaceTest
    def setup
      @board = @object = Board.new(5,5)
    end

    def test_that_knows_a_valid_pose
      pose = {x: 0, y: 0}
      assert @board.valid_pose?(pose)
    end

    def test_that_knows_an_invalid_pose
      [[-1,0], [0,-1], [6,0], [0,6]].each do |out_of_range|
        pose = {x: out_of_range[0], y: out_of_range[1]}
        refute @board.valid_pose?(pose), "Pose #{pose} should be invalid"
      end
    end
  end
end
