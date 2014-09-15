module ToyRobot
  class Robot
    def initialize(args)
      @board = args[:board]
      @pose = args[:pose]
    end

    def place(a_new_pose)
      pose.mutate!(a_new_pose) if board.valid_pose?(a_new_pose)
      nil
    end

    def move
      with_placement { place(pose.adjacent) and nil }
    end

    def right
      with_placement { pose.rotate!(90) and nil }
    end

    def left
      with_placement { pose.rotate!(-90) and nil }
    end

    def report
      with_placement { pose.report }
    end

    private

    attr_reader :board, :pose

    def with_placement
      yield if board && board.valid_pose?(pose)
    end
  end
end
