require_relative '../lib/toy_robot/command/parser/base'
require_relative 'test_command_parser_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandParserRightTest < MiniTest::Unit::TestCase
    include CommandParserInterfaceTest

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
end
