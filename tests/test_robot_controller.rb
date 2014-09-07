require './lib/toy_robot_simulator/robot_controller'
require 'minitest/autorun'

class RobotControllerTest < MiniTest::Unit::TestCase
  def setup
    @robot = MiniTest::Mock.new
    @robot_controller = RobotController.new(robot: @robot)
  end

  def test_respond_to_public_interface
    assert_respond_to @robot_controller, :execute
  end

  def test_it_executes_a_place_command
    command = 'PLACE 0,0,NORTH'
    @robot.expect(:place, nil, ['some_args'])
    @robot_controller.execute('some_args')
    @robot.verify
  end
end
