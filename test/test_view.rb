require './lib/toy_robot_simulator/view'
require 'minitest/autorun'

class ViewTest < MiniTest::Unit::TestCase
  def setup
    @output = MiniTest::Mock.new
    @robot_double = OpenStruct.new(
      report: {
        x: 'X',
        y: 'Y',
        orientation: :facing
      }
    )
    @view = View.new(
      robot: @robot_double,
      output: @output
    )
  end

  def test_responds_to_public_interface
    assert_respond_to @view, :report
  end

  def test_that_it_reports
    write = 'X,Y,FACING'
    @output.expect :puts, nil, [write]
    @view.report
    @output.verify
  end
end
