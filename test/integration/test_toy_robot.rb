require 'minitest/autorun'

module ToyRobot
  class ToyRobotTest < MiniTest::Unit::TestCase
    def test_that_it_is_executable
      assert `bin/toyrobot < data/example_input_a.txt`
    end
  end
end
