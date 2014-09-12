require_relative '../lib/toy_robot/command/parser/base'
require_relative 'test_command_parser_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandParserLeftTest < MiniTest::Unit::TestCase
    include CommandParserInterfaceTest

    def setup
      @object = Command::Parser::Left
      @object_token = Command::Token::LEFT
      @object_valid_str = 'LEFT'
      @object_invalid_strs = [
        'LEFT ',
        'LEFTY',
        'LEFT 180'
      ]
    end
  end
end
