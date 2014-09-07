require './lib/toy_robot_simulator/robot.rb'
require './tests/test_reporter_interface'
require 'minitest/autorun'

class RobotTest < MiniTest::Unit::TestCase
  include ReporterInterfaceTest

  def setup
    @observer = MiniTest::Mock.new
    @robot = @object = Robot.new(placement: @observer)
  end

  def teardown
    @observer = nil
    @robot = nil
  end

  def test_that_it_places
    @observer.expect(:update, nil, [nil])
    @robot.place(nil)
    @observer.verify
  end

  def test_that_it_moves
    @observer.expect(:advance, nil)
    @robot.move
    @observer.verify
  end

  def test_that_it_turns_right
    @observer.expect(:rotate, nil, [90])
    @robot.right
    @observer.verify
  end

  def test_that_it_turns_left
    @observer.expect(:rotate, nil, [-90])
    @robot.left
    @observer.verify
  end

  def test_that_it_reports
    @observer.expect(:report, nil)
    @robot.report
    @observer.verify
  end
end
