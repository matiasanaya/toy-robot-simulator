require './lib/toy_robot_simulator/command/matcher/base'
require 'minitest/autorun'

class CommandMatcherMoveTest < MiniTest::Unit::TestCase
  def setup
    @move_matcher = Command::Matcher::Move
    @valid_str = 'MOVE'
  end

  def test_respond_to_public_interface
    assert_respond_to @move_matcher, :build_with_match
  end

  def test_that_it_matches_move
    assert @move_matcher.build_with_match(@valid_str)
  end

  def test_that_it_ignores_others
    refute @move_matcher.build_with_match('MOVE ')
  end

  def test_that_response_knows_token
    assert_equal Command::Token::MOVE,
                 @move_matcher.build_with_match(@valid_str).token
  end

  def test_that_response_knows_args
    assert_equal @move_matcher.send(:extract_args, @valid_str),
                 @move_matcher.build_with_match(@valid_str).args
  end

  def test_that_response_is_nil
    assert_equal nil, @move_matcher.build_with_match('f34j89f34f893h')
  end
end
