require './lib/toy_robot_simulator/robot_controller'
require 'minitest/autorun'

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
    assert_respond_to @robot_controller, :input
  end

  def test_it_delegates_a_place_command_to_robot
    @command_double.token = Command::Token::PLACE

    @robot.expect(:place, nil, [@command_double.args])
    @robot_controller.input(@command_double)
    @robot.verify
  end

  def test_it_delegates_a_move_command_to_robot
    @command_double.token = Command::Token::MOVE

    @robot.expect(:move, nil)
    @robot_controller.input(@command_double)
    @robot.verify
  end

  def test_it_delegates_a_left_command_to_robot
    @command_double.token = Command::Token::LEFT

    @robot.expect(:left, nil)
    @robot_controller.input(@command_double)
    @robot.verify
  end

  def test_it_delegates_a_right_command_to_robot
    @command_double.token = Command::Token::RIGHT

    @robot.expect(:right, nil)
    @robot_controller.input(@command_double)
    @robot.verify
  end

  def test_it_delegates_a_report_command_to_view
    @command_double.token = Command::Token::REPORT

    @view.expect(:report, nil)
    @robot_controller.input(@command_double)
    @view.verify
  end
end
