module ToyRobot
  module ReporterInterfaceTest
    def test_it_implement_the_reproter_interface
      assert_respond_to @object, :report
    end
  end
end
