require 'forwardable'

class Robot
  extend Forwardable

  def_delegator :placement, :update!, :place

  def initialize(args)
    @placement = args[:placement]
  end

  def move
    self.placement = placement.adjacent
  end

  def right
    self.placement = placement.rotate!(90)
  end

  def left
    self.placement = placement.rotate!(-90)
  end

  private

  attr_accessor :placement
end
