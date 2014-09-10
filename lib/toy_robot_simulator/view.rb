View = Struct.new(:args) do
  def report
    report = robot.report
    output.puts report_string(report) if report
  end

  private

  def report_string(report)
    "#{report[:x]},#{report[:y]},#{report[:orientation].upcase}"
  end

  def robot
    args[:robot]
  end

  def output
    args[:output] || $stdout
  end
end
