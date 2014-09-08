require './lib/toy_robot_simulator/command/matcher/place'
require './tests/test_command_matcher_interface'
require 'minitest/autorun'

class CommandMatcherPlaceTest < MiniTest::Unit::TestCase
  include CommandMatcherInterfaceTest

  def setup
    @object = Command::Matcher::Place
    @object_token = Command::Token::PLACE
    @object_valid_str = 'PLACE 0,0,NORTH'
    @object_invalid_strs = [
      'PLACE',
      'PLACE ',
      'PLACE X,Y,Z,F',
      'PLACE 0,0,OTHER',
      'PLACE 0,0',
      'PLACE 0,a,NORTH',
      'PLACE a,99,NORTH',
      'PLACE a,NORHT',
      'PLACE 0,NORTH'
    ]
  end
end
