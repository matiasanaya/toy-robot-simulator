require_relative '../lib/toy_robot/command/parser'
require 'minitest/autorun'

module ToyRobot
  class CommandMatcherTest < MiniTest::Unit::TestCase
    def setup
      @matcher = Command::Parser
    end

    def test_that_it_can_parse
      refute_equal nil, @matcher.parse('PLACE 0,0,NORTH')
    end

    def test_that_parsing_can_fail
      assert_equal nil, @matcher.parse('PLACE 0,0,NORTHISH')
    end

    def test_that_it_knows_all_matchers
      all = @matcher.all

      assert_includes all, Command::Parser::Place

      assert_includes all, Command::Parser::Move

      assert_includes all, Command::Parser::Left

      assert_includes all, Command::Parser::Right

      assert_includes all, Command::Parser::Report
    end
  end
end
