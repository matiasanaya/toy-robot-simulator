module ToyRobot
  class View
    def initialize(args)
      @robot = args[:robot]
      @output = args[:output] || $stdout
    end

    def report
      output.puts format_report(robot.report)
    end

    private

    attr_reader :robot, :output

    def format_report(report)
      "#{report[:x]},#{report[:y]},#{report[:orientation].upcase}" if report
    end
  end
end
