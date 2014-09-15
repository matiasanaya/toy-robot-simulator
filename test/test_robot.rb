require_relative '../lib/toy_robot/robot'
require_relative 'test_reporter_interface'
require_relative 'board_double'
require_relative 'pose_double'
require 'minitest/autorun'

module ToyRobot
  class RobotTest < MiniTest::Unit::TestCase
    include ReporterInterfaceTest

    def setup
      @board = BoardDouble.new
      @pose = PoseDouble.new
      @robot = @object = Robot.new(board: @board, pose: @pose)
      @mock = MiniTest::Mock.new
    end

    def teardown
      @board, @pose, @robot, @mock = nil, nil, nil, nil
    end

    def test_that_it_implements_robot_public_interface
      assert_respond_to @robot, :place
      assert_respond_to @robot, :move
      assert_respond_to @robot, :right
      assert_respond_to @robot, :left
    end

    def test_that_place_returns_nil
      assert_nil @robot.place(nil)
    end

    def test_that_move_returns_nil
      assert_nil @robot.move
    end

    def test_that_right_returns_nil
      assert_nil @robot.right
    end

    def test_that_left_returns_nil
      assert_nil @robot.left
    end

    def test_that_it_places
      @board.stub :valid_pose?, true do
        @robot.instance_variable_set(:@pose, @mock)
        @mock.expect(:mutate!, nil, ['a valid pose'])

        @robot.place('a valid pose')

        @mock.verify
      end
    end

    def test_that_it_does_not_place_if_pose_is_invalid
      @board.stub :valid_pose?, false do
        @robot.instance_variable_set(:@pose, @mock)

        @robot.place('a invalid pose')

        @mock.verify
      end
    end

    def test_that_it_moves_one_step_at_a_time
      @board.stub :valid_pose?, true do
        @robot.instance_variable_set(:@pose, @mock)
        @mock.expect(:adjacent, 'a adjacent pose')
        @mock.expect(:mutate!, nil, ['a adjacent pose'])

        @robot.move

        @mock.verify
      end
    end

    def test_that_it_does_not_move_if_next_to_border
      @board.stub :valid_pose?, false do
        @robot.instance_variable_set(:@pose, @mock)

        @robot.move

        @mock.verify
      end
    end

    def test_that_it_turns_right
      @robot.instance_variable_set(:@pose, @mock)
      @mock.expect(:rotate!, nil, [90])
      @robot.right
      @mock.verify
    end

    def test_that_it_turns_left
      @robot.instance_variable_set(:@pose, @mock)
      @mock.expect(:rotate!, nil, [-90])
      @robot.left
      @mock.verify
    end

    def test_that_it_ignores_commands_if_unplaced
      @robot.instance_variable_set(:@board, nil)
      @robot.instance_variable_set(:@pose, @mock)

      [:move, :right, :left, :report].each do |command|
        @robot.send(command)
      end

      @mock.verify
    end
  end
end
