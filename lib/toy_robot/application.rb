require_relative 'factory'
require_relative 'command/parser'

module ToyRobot
  class Application
    def initialize(argv = [], args = {})
      @input = args[:input] || $stdin
      @parser = Command::Parser
      @controller = Factory.create(:controller)
    end

    def run(options = nil)
      loop do
        raw_input = input.gets
        break unless raw_input
        raw_input.chomp!
        command = parser.parse(raw_input)
        controller.send(command.token, command.args) if command
      end
    end

    private

    attr_reader :input, :parser, :controller
  end
end
