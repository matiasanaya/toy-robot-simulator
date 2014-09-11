require_relative '../lib/toy_robot_simulator/command/command'
require 'minitest/autorun'

class CommandTest < MiniTest::Unit::TestCase
  def test_tokens_are_defined
    assert defined?(Command::Token::PLACE)

    assert defined?(Command::Token::MOVE)

    assert defined?(Command::Token::RIGHT)

    assert defined?(Command::Token::LEFT)

    assert defined?(Command::Token::REPORT)
  end

  def test_base_is_defined
    assert defined?(Command::Base)
  end
end
