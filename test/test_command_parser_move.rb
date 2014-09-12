require_relative '../lib/toy_robot/command/parser/base'
require_relative 'test_command_parser_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandParserMoveTest < MiniTest::Unit::TestCase
    include CommandParserInterfaceTest

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
end
