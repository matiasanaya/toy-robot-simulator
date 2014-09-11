require_relative '../../lib/toy_robot_simulator/factory'
require 'minitest/autorun'

module ToyRobot
  class FactoryTest < MiniTest::Unit::TestCase
    def setup
      @object = Factory
    end

    def test_public_interface
      assert_respond_to @object, :create
    end

    def test_that_create_returns_a_robot_controller
      assert_instance_of RobotController, @object.create(:controller)
    end
  end
end
