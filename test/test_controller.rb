require_relative '../lib/toy_robot/controller'
require 'minitest/autorun'

module ToyRobot
  class ControllerTest < MiniTest::Unit::TestCase
    def setup
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
      args = Object.new
      @robot.expect(:place, nil, [args])

      @controller.place(args)

      @robot.verify
    end

    def test_it_delegates_a_move_command_to_robot
      @robot.expect(:move, nil)

      @controller.move(nil)

      @robot.verify
    end

    def test_it_delegates_a_left_command_to_robot
      @robot.expect(:left, nil)

      @controller.left(nil)

      @robot.verify
    end

    def test_it_delegates_a_right_command_to_robot
      @robot.expect(:right, nil)

      @controller.right(nil)

      @robot.verify
    end

    def test_it_delegates_a_report_command_to_view
      @view.expect(:report, nil)

      @controller.report(nil)

      @view.verify
    end
  end
end
