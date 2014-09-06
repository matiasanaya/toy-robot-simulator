require 'forwardable'

class Robot
  extend Forwardable

  def_delegator :placement, :update!, :place

  def initialize(args)
    @placement = args[:placement]
  end

  private

  attr_reader :placement
end
