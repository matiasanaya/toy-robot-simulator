require 'forwardable'

module ToyRobot
  class Placement
    extend Forwardable

    def_delegator :pose, :report
    def_delegator :pose, :rotate!, :rotate

    def initialize(args)
      @board = args[:board]
      @pose = args[:pose]
    end

    def on_board?
      board && board.valid_pose?(pose)
    end

    def update(a_new_pose)
      if board.valid_pose?(a_new_pose)
        self.pose = a_new_pose
      end
    end

    def advance
      update(pose.adjacent)
    end

    private

    attr_reader :board
    attr_accessor :pose
  end
end
