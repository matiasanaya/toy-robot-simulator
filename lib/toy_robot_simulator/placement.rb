require 'forwardable'

class Placement
  extend Forwardable

  def_delegators :pose, :rotate!, :report

  def initialize(args)
    @board = args[:board]
    @pose = args[:pose]
  end

  def update!(a_new_pose)
    if board.valid_pose?(a_new_pose)
      self.pose = a_new_pose
    end
    pose
  end

  def adjacent
    adjacent_pose = pose.adjacent
    if board.valid_pose?(adjacent_pose)
      self.class.new(board: board, pose: adjacent_pose)
    else
      self
    end
  end

  private

  attr_reader :board
  attr_accessor :pose
end
