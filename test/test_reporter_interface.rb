module ToyRobot
  module ReporterInterfaceTest
    def test_it_implements_the_reproter_interface
      assert_respond_to @object, :report
    end

    def test_that_it_reports_x
      assert_includes @object.report, :x
    end

    def test_that_it_reports_y
      assert_includes @object.report, :y
    end

    def test_that_it_reports_orientation
      assert_includes @object.report, :orientation
    end
  end
end
