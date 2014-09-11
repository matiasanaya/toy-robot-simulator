require_relative '../../lib/toy_robot'
require 'minitest/autorun'

module ToyRobot
  class ToyRobotTest < MiniTest::Unit::TestCase
    def setup
      @app = lambda { |f| ToyRobot::Application.new(nil, input: f).run }
    end
    def test_example_input_a
      file = File.open('data/example_input_a.txt', 'r')
      assert_output(/\A0,1,NORTH\n\z/) { @app.call(file) }
    end

    def test_example_input_b
      file = File.open('data/example_input_b.txt', 'r')
      assert_output(/\A0,0,WEST\n\z/) { @app.call(file) }
    end

    def test_example_input_c
      file = File.open('data/example_input_c.txt', 'r')
      assert_output(/\A3,3,NORTH\n\z/) { @app.call(file) }
    end
  end
end
