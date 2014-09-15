class PoserDouble
  attr_reader :x, :y, :orientation

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
    @orientation = args[:orientation]
  end
end
