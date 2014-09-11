require_relative 'factory'
require_relative 'command/parser'

class Application
  def initialize(argv = [])
    @input = $stdin
    @parser = Command::Parser
    @controller = Factory.create(:controller)
  end

  def run(options = nil)
    loop do
      raw_input = input.gets
      break unless raw_input
      raw_input.chomp!
      debug(raw_input)
      command = parser.parse(raw_input)
      controller.input(command) if command
    end
  end

  private

  attr_reader :input, :parser, :controller

  def debug(raw_input)
    case raw_input
    when /\AR(EPORT_DEBUG)*\z/
      puts controller.instance_variable_get(:@robot).inspect
    when /\AE(XIT)*\z/
      puts 'Have a nice day, bye :)'
      puts '...'
      exit(false)
    end
  end
end
