class PoseDouble
  def mutate!(_ = nil)
    self
  end

  def adjacent
    self.class.new
  end

  def rotate!(_)
    self
  end

  def report
    {
      x: 0,
      y: 0,
      orientation: :facing
    }
  end
end
