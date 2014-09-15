require_relative 'base'

module ToyRobot
  module Command
    module Parser
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

        {
          x: x.to_i,
          y: y.to_i,
          orientation: constantize_orientation.call(f)
        }
      end

      Place = Base.new(
        msg: :place,
        regex: /\APLACE \d+,\d+,(NORTH|SOUTH|EAST|WEST)\z/,
        args_extractor: place_args_extractor
      )
    end
  end
end
