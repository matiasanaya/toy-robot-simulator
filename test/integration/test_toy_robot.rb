require 'minitest/autorun'

module ToyRobot
  class ToyRobotTest < MiniTest::Unit::TestCase
    def test_that_it_is_executable
      assert `bin/toy_robot < data/example_input_a.txt`
    end

    def test_example_input_a
      output = `ruby bin/toy_robot < data/example_input_a.txt`
      assert_match /\A0,1,NORTH\n\z/, output
    end

    def test_example_input_b
      output = `ruby bin/toy_robot < data/example_input_b.txt`
      assert_match /\A0,0,WEST\n\z/, output
    end

    def test_example_input_c
      output = `ruby bin/toy_robot < data/example_input_c.txt`
      assert_match /\A3,3,NORTH\n\z/, output
    end
  end
end
