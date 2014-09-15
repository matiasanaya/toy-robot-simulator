require_relative 'pose_double'
require_relative 'test_pose_interface'
require_relative 'test_reporter_interface'
require 'minitest/autorun'

module ToyRobot
  class PoseDoubleTest < MiniTest::Unit::TestCase
    include PoseInterfaceTest
    include ReporterInterfaceTest

    def setup
      @object = PoseDouble.new
    end
  end
end
