require_relative '../lib/toy_robot/command/base'
require 'minitest/autorun'

module ToyRobot
  class CommandBaseTest < MiniTest::Unit::TestCase
    def test_that_it_responds_to_public_intergace
      base = Command::Base.new
      assert_respond_to base, :msg
      assert_respond_to base, :args
    end
  end
end
