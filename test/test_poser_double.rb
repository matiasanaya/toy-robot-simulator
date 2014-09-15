require_relative 'poser_double'
require_relative 'test_poser_interface'
require 'minitest/autorun'

module ToyRobot
  class PoserDoubleTest < MiniTest::Unit::TestCase
    include PoserInterfaceTest

    def setup
      @object = PoserDouble.new(x: 1, y: 2, orientation: :facing)
    end

    def test_it_returns_correct_x
      assert_equal 1, @object.x
    end

    def test_it_returns_correct_y
      assert_equal 2, @object.y
    end

    def test_it_returns_correct_orientation
      assert_equal :facing, @object.orientation
    end
  end
end
