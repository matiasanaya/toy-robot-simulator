require 'minitest/autorun'

module ToyRobot
  class ToyRobotTest < MiniTest::Unit::TestCase
    def test_that_it_is_executable
      assert system('[ -x bin/toyrobot ]')
    end
  end
end
