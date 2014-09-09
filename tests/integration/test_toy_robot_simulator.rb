require 'minitest/autorun'

class ToyRobotSimulatorTest < MiniTest::Unit::TestCase
  def test_example_input_a
    output = `ruby bin/toy_robot_simulator < data/example_input_a.txt`
    assert_equal '0,1,NORTH', output
  end

  def test_example_input_b
    output = `ruby bin/toy_robot_simulator < data/example_input_b.txt`
    assert_equal '0,0,WEST', output
  end

  def test_example_input_c
    output = `ruby bin/toy_robot_simulator < data/example_input_c.txt`
    assert_equal '3,3,NORTH', output
  end
end
