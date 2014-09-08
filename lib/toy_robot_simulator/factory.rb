require_relative 'robot_controller'
require_relative 'robot'
require_relative 'placement'
require_relative 'board'
require_relative 'pose'
require_relative 'view'

module Factory
  module_function

  def create(identifier, opts = {})
    case identifier
    when :controller
      RobotControllerFactory.create(opts)
    end
  end

  module RobotControllerFactory
    module_function

    def create(opts = {})
      robot = opts[:robot] || RobotFactory.create
      view = opts[:view] || ViewFactory.create(robot: robot)

      ::RobotController.new(
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

      ::View.new(
        robot: robot,
        output: output
      )
    end
  end

  module RobotFactory
    module_function

    def create(opts = {})
      placement = opts[:placement] || PlacementFactory.create

      ::Robot.new(
        placement: placement
      )
    end
  end

  module PlacementFactory
    module_function

    def create(opts = {})
      board = opts[:board] || BoardFactory.create
      pose = opts[:pose] || ::Pose.new
      ::Placement.new(
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

      ::Board.new(x, y)
    end
  end
end
