class Board
  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  def valid_pose?(pose)
    pose && (0..x_size).include?(pose.x) && (0..y_size).include?(pose.y)
  end

  private

  attr_reader :x_size, :y_size
end
