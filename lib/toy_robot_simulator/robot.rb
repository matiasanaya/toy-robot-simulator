require 'forwardable'

class Robot
  extend Forwardable

  def initialize(args)
    @placement = args[:placement]
  end

  def place(*args)
    with_placement { placement.update(*args) }
  end

  def move
    with_placement { placement.advance }
  end

  def right
    with_placement { placement.rotate(90) }
  end

  def left
    with_placement { placement.rotate(-90) }
  end

  def report
    with_placement { placement.report }
  end

  private

  attr_accessor :placement

  def with_placement
    if placement.on_board?
      yield
    end
  end
end
