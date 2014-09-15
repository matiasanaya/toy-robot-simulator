require_relative '../lib/toy_robot/board'
require_relative 'test_board_interface'
require_relative 'poser_double'
require 'minitest/autorun'

module ToyRobot
  class BoardTest < MiniTest::Unit::TestCase
    include BoardInterfaceTest
    def setup
      @board = @object = Board.new(5,5)
    end

    def test_that_knows_a_valid_pose
      poser_double = PoserDouble.new(x: 0, y: 0)
      assert @board.valid_pose?(poser_double)
    end

    def test_that_knows_an_invalid_pose
      [[-1,0], [0,-1], [6,0], [0,6]].each do |out_of_range|
        poser_double = PoserDouble.new(x: out_of_range[0], y: out_of_range[1])
        refute @board.valid_pose?(poser_double), "Pose #{poser_double} should be invalid"
      end
    end
  end
end
