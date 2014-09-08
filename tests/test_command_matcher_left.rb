require './lib/toy_robot_simulator/command/matcher/base'
require './tests/test_command_matcher_interface'
require 'minitest/autorun'

class CommandMatcherLeftTest < MiniTest::Unit::TestCase
  include CommandMatcherInterfaceTest

  def setup
    @object = Command::Matcher::Left
    @object_token = Command::Token::LEFT
    @object_valid_str = 'LEFT'
    @object_invalid_strs = [
      'LEFT ',
      'LEFTY',
      'LEFT 180'
    ]
  end
end
