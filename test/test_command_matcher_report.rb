require_relative '../lib/toy_robot_simulator/command/parser/base'
require_relative 'test_command_matcher_interface'
require 'minitest/autorun'

module ToyRobot
  class CommandMatcherReportTest < MiniTest::Unit::TestCase
    include CommandMatcherInterfaceTest

    def setup
      @object = Command::Parser::Report
      @object_token = Command::Token::REPORT
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
