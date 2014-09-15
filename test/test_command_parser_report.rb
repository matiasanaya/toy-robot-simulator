require_relative '../lib/toy_robot/command/parser/report'
require_relative 'test_command_parser_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandParserReportTest < MiniTest::Unit::TestCase
    include CommandParserInterfaceTest

    def setup
      @object = Command::Parser::Report
      @object_msg = :report
      @object_valid_str = 'REPORT'
      @object_invalid_strs = [
        'REPORT ',
        'REPORTNOW',
        'REP',
        'R'
      ]
    end
  end
end
