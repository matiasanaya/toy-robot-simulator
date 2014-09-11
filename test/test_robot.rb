require_relative '../lib/toy_robot/robot'
require_relative 'test_reporter_interface'
require 'minitest/autorun'

module ToyRobot
  class RobotTest < MiniTest::Unit::TestCase
    include ReporterInterfaceTest

    def setup
      @observer = MiniTest::Mock.new.expect(:on_board?, true)
      @robot = @object = Robot.new(placement: @observer)
    end

    def teardown
      @observer = nil
      @robot = nil
    end

    def test_respond_to_public_interface
      assert_respond_to @robot, :place
      assert_respond_to @robot, :move
      assert_respond_to @robot, :right
      assert_respond_to @robot, :left
    end

    def test_that_it_places
      placement = MiniTest::Mock.new.expect(:update, nil, [nil])
      @robot.instance_variable_set(:@placement, placement)

      @robot.place(nil)
      placement.verify
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

    def test_that_it_ignores_commands_if_unplaced
      observer = MiniTest::Mock.new
      @robot.instance_variable_set(:@placement, observer)

      [:move, :right, :left, :report].each do |command|
        observer.expect(:on_board?, false)
        @robot.send(command)
      end

      observer.verify
    end
  end
end
