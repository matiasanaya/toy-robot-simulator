module ToyRobot
  class Controller
    def initialize(args)
      @robot = args[:robot]
      @view = args[:view]
    end

    def place(*args)
      robot.place(*args)
    end

    def move(*_)
      robot.move
    end

    def left(*_)
      robot.left
    end

    def right(*_)
      robot.right
    end

    def report(*_)
      view.report
    end

    private

    attr_reader :robot, :view
  end
end
