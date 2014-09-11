require_relative 'base'
require_relative '../../pose'

module Command
  module Matcher
    constantize_orientation = lambda do |string|
      case string
      when 'EAST'
        Pose::Orientation::EAST
      when 'NORTH'
        Pose::Orientation::NORTH
      when 'WEST'
        Pose::Orientation::WEST
      when 'SOUTH'
        Pose::Orientation::SOUTH
      end
    end

    place_args_extractor = lambda do |raw_command|
      x, y, f = raw_command.split.pop.split(',')

      Pose.new(
        x: x.to_i,
        y: y.to_i,
        orientation: constantize_orientation.call(f)
      )
    end

    Place = Base.new(
      token: Command::Token::PLACE,
      regex: /\APLACE \d+,\d+,(NORTH|SOUTH|EAST|WEST)\z/,
      args_extractor: place_args_extractor
    )
  end
end
