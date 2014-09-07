require 'forwardable'

class Placement
  extend Forwardable

  def_delegators :pose, :rotate, :report

  def initialize(args)
    @board = args[:board]
    @pose = args[:pose]
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
