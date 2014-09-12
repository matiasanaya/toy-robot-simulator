require_relative '../lib/toy_robot/controller'
require 'minitest/autorun'

module ToyRobot
  class ControllerTest < MiniTest::Unit::TestCase
    CommandDouble = Struct.new(:msg, :args)

    def setup
      @command_double = CommandDouble.new(nil, nil)
      @robot = MiniTest::Mock.new
      @view = MiniTest::Mock.new
      @controller = Controller.new(
        robot: @robot,
        view: @view
      )
    end

    def test_respond_to_public_interface
      assert_respond_to @controller, :place
      assert_respond_to @controller, :move
      assert_respond_to @controller, :right
      assert_respond_to @controller, :left
      assert_respond_to @controller, :report
    end

    def test_it_delegates_a_place_command_to_robot
      @command_double.msg = :place
      args = Object.new
      @command_double.args = args

      @robot.expect(:place, nil, [args])
      @controller.send(@command_double.msg, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_move_command_to_robot
      @command_double.msg = :move

      @robot.expect(:move, nil)
      @controller.send(@command_double.msg, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_left_command_to_robot
      @command_double.msg = :left

      @robot.expect(:left, nil)
      @controller.send(@command_double.msg, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_right_command_to_robot
      @command_double.msg = :right

      @robot.expect(:right, nil)
      @controller.send(@command_double.msg, @command_double.args)
      @robot.verify
    end

    def test_it_delegates_a_report_command_to_view
      @command_double.msg = :report

      @view.expect(:report, nil)
      @controller.send(@command_double.msg, @command_double.args)
      @view.verify
    end
  end
end
