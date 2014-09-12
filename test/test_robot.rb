require_relative '../lib/toy_robot/robot'
require_relative 'test_reporter_interface'
require 'minitest/autorun'

module ToyRobot
  class RobotTest < MiniTest::Unit::TestCase
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
      @pose_mock = MiniTest::Mock.new
      @board = SimpleDouble.new(valid_pose?: true)
      @adjacent_pose = Object.new
      @pose = SimpleDouble.new(adjacent: @adjacent_pose)
      @robot = @object = Robot.new(board: @board, pose: @pose)
    end

    def teardown
      @board, @pose, @robot = nil, nil, nil
    end

    def test_respond_to_public_interface
      assert_respond_to @robot, :place
      assert_respond_to @robot, :move
      assert_respond_to @robot, :right
      assert_respond_to @robot, :left
    end

    def test_that_it_places
      a_new_pose = Object.new
      @robot.place(a_new_pose)

      assert_equal a_new_pose, @robot.instance_variable_get(:@pose)
    end

    def test_that_placement_might_fail
      failing_board = SimpleDouble.new(valid_pose?: false)
      @robot.instance_variable_set(:@board, failing_board)

      @robot.place('A failing Pose')

      assert_equal @pose, @robot.instance_variable_get(:@pose)
    end

    def test_that_it_moves_one_step_at_a_time
      @robot.move
      assert_equal @adjacent_pose, @robot.instance_variable_get(:@pose)
    end

    def test_that_it_turns_right
      @robot.instance_variable_set(:@pose, @pose_mock)
      @pose_mock.expect(:rotate!, nil, [90])
      @robot.right
      @pose_mock.verify
    end

    def test_that_it_turns_left
      @robot.instance_variable_set(:@pose, @pose_mock)
      @pose_mock.expect(:rotate!, nil, [-90])
      @robot.left
      @pose_mock.verify
    end

    def test_that_it_reports
      @robot.instance_variable_set(:@pose, @pose_mock)
      @pose_mock.expect(:report, nil)
      @robot.report
      @pose_mock.verify
    end

    def test_that_it_ignores_commands_if_unplaced
      @robot.instance_variable_set(:@board, nil)
      @robot.instance_variable_set(:@pose, @pose_mock)

      [:move, :right, :left, :report].each do |command|
        @robot.send(command)
      end

      @pose_mock.verify
    end
  end
end
