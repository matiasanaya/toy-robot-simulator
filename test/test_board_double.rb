require_relative 'board_double'
require_relative 'test_board_interface'
require 'minitest/autorun'

module ToyRobot
  class BoardDoubleTest < MiniTest::Unit::TestCase
    include BoardInterfaceTest

    def setup
      @object = BoardDouble.new
    end
  end
end
