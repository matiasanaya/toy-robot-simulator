require_relative '../lib/toy_robot_simulator/command/parser/base'
require_relative 'test_command_matcher_interface'
require 'minitest/autorun'

class CommandMatcherMoveTest < MiniTest::Unit::TestCase
  include CommandMatcherInterfaceTest

  def setup
    @object = Command::Parser::Move
    @object_token = Command::Token::MOVE
    @object_valid_str = 'MOVE'
    @object_invalid_strs = [
      'MOVE ',
      'MOVER',
      'MOVE 180',
      'move'
    ]
  end
end
