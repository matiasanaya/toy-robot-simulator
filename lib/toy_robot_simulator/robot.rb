require 'forwardable'

class Robot
  extend Forwardable

  def_delegator :placement, :report
  def_delegator :placement, :update, :place
  def_delegator :placement, :advance, :move

  def initialize(args)
    @placement = args[:placement]
  end

  def right
    placement.rotate(90)
  end

  def left
    placement.rotate(-90)
  end

  private

  attr_accessor :placement
end
