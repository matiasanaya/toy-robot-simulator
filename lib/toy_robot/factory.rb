require_relative 'controller'
require_relative 'robot'
require_relative 'board'
require_relative 'pose'
require_relative 'view'

module ToyRobot
  module Factory
    module_function

    def create(identifier, opts = {})
      case identifier
      when :controller
        ControllerFactory.create(opts)
      end
    end

    module ControllerFactory
      module_function

      def create(opts = {})
        robot = opts[:robot] || RobotFactory.create
        view = opts[:view] || ViewFactory.create(robot: robot)

        ToyRobot::Controller.new(
          robot: robot,
          view: view
        )
      end
    end

    module ViewFactory
      module_function

      def create(opts = {})
        robot = opts[:robot] || RobotFactory.create
        output = opts[:output] || $stdout

        ToyRobot::View.new(
          robot: robot,
          output: output
        )
      end
    end

    module RobotFactory
      module_function

      def create(opts = {})
        board = opts[:board] || BoardFactory.create
        pose = opts[:pose] || ToyRobot::Pose.new

        ToyRobot::Robot.new(
          board: board,
          pose: pose
        )
      end
    end

    module BoardFactory
      module_function

      def create(opts = {})
        x = opts[:x] || 5
        y = opts[:y] || 5

        ToyRobot::Board.new(x, y)
      end
    end
  end
end
