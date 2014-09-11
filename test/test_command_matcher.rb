require './lib/toy_robot_simulator/command/matcher/matcher'
require 'minitest/autorun'

class CommandMatcherTest < MiniTest::Unit::TestCase
  def setup
    @matcher = Command::Matcher
  end

  def test_that_it_can_parse
    refute_equal nil, @matcher.parse('PLACE 0,0,NORTH')
  end

  def test_that_parsing_can_fail
    assert_equal nil, @matcher.parse('PLACE 0,0,NORTHISH')
  end

  def test_that_it_knows_all_matchers
    all = @matcher.all

    assert_includes all, Command::Matcher::Place

    assert_includes all, Command::Matcher::Move

    assert_includes all, Command::Matcher::Left

    assert_includes all, Command::Matcher::Right

    assert_includes all, Command::Matcher::Report
  end
end
