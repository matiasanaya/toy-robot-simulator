require_relative '../lib/toy_robot/robot_controller'
require 'minitest/autorun'

module ToyRobot
  class RobotControllerTest < MiniTest::Unit::TestCase
    CommandDouble = Struct.new(:token, :args)

    def setup
      @command_double = CommandDouble.new(nil, nil)
      @robot = MiniTest::Mock.new
      @view = MiniTest::Mock.new
      @robot_controller = RobotController.new(
        robot: @robot,
        view: @view
      )
    end

    def test_respond_to_public_interface
      assert_respond_to @robot_controller, :place
      assert_respond_to @robot_controller, :move
      assert_respond_to @robot_controller, :right
      assert_respond_to @robot_controller, :left
      assert_respond_to @robot_controller, :report
    end

    def test_it_delegates_a_place_command_to_robot
      @command_double.token = :place
      args = Object.new
      @command_double.args = args

      @robot.expect(:place, nil, [args])
      @robot_controller.send(@command_double.token, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_move_command_to_robot
      @command_double.token = :move

      @robot.expect(:move, nil)
      @robot_controller.send(@command_double.token, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_left_command_to_robot
      @command_double.token = :left

      @robot.expect(:left, nil)
      @robot_controller.send(@command_double.token, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_right_command_to_robot
      @command_double.token = :right

      @robot.expect(:right, nil)
      @robot_controller.send(@command_double.token, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_report_command_to_view
      @command_double.token = :report

      @view.expect(:report, nil)
      @robot_controller.send(@command_double.token, @command_double.args)
      @view.verify
    end
  end
end
