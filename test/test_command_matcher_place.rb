require './lib/toy_robot_simulator/command/matcher/place'
require_relative 'test_command_matcher_interface'
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

  def test_that_response_args_know_x
    assert_equal 123,
                 @object.build_with_match('PLACE 123,0,NORTH').args.x
  end

  def test_that_response_args_know_y
    assert_equal 123,
                 @object.build_with_match('PLACE 0,123,NORTH').args.y
  end

  def test_that_response_args_knows_north_orientation
    assert_equal Pose::Orientation::NORTH,
                 @object.build_with_match('PLACE 0,123,NORTH').args.orientation
  end

  def test_that_response_args_knows_south_orientation
    assert_equal Pose::Orientation::SOUTH,
                 @object.build_with_match('PLACE 0,123,SOUTH').args.orientation
  end

  def test_that_response_args_knows_east_orientation
    assert_equal Pose::Orientation::EAST,
                 @object.build_with_match('PLACE 0,123,EAST').args.orientation
  end

  def test_that_response_args_knows_west_orientation
    assert_equal Pose::Orientation::WEST,
                 @object.build_with_match('PLACE 0,123,WEST').args.orientation
  end
end
