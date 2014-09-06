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

  private

  attr_accessor :placement
end
