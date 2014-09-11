require './lib/toy_robot_simulator/command/matcher/base'
require_relative 'test_command_matcher_interface'
require 'minitest/autorun'

class CommandMatcherReportTest < MiniTest::Unit::TestCase
  include CommandMatcherInterfaceTest

  def setup
    @object = Command::Matcher::Report
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
