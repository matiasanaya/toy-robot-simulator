require_relative '../lib/toy_robot/command/parser/move'
require_relative 'test_command_parser_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandParserMoveTest < MiniTest::Unit::TestCase
    include CommandParserInterfaceTest

    def setup
      @object = Command::Parser::Move
      @object_msg = :move
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
