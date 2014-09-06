require './lib/toy_robot_simulator/robot.rb'
require 'minitest/autorun'

class RobotTest < MiniTest::Unit::TestCase
  def setup
    @placement = MiniTest::Mock.new
    @robot = Robot.new(placement: @placement)
    @_ = Object.new
  end

  def test_that_it_delegates_placing
    @placement.expect(:update!, nil, [@_])
    @robot.place(@_)
    @placement.verify
  end

  def test_that_it_moves
    adjacent_placement = Object.new
    @placement.expect(:adjacent, adjacent_placement)

    @robot.move
    assert_equal adjacent_placement, @robot.send('placement')
  end
end
