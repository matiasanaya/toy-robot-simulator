require_relative '../lib/toy_robot_simulator/command/parser/base'
require_relative 'test_command_matcher_interface'
require 'minitest/autorun'

class CommandMatcherRightTest < MiniTest::Unit::TestCase
  include CommandMatcherInterfaceTest

  def setup
    @object = Command::Parser::Right
    @object_token = Command::Token::RIGHT
    @object_valid_str = 'RIGHT'
    @object_invalid_strs = [
      'RIGHT ',
      'RIGHTY',
      'RIGHT 180'
    ]
  end
end
