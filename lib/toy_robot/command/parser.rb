require_relative 'parser/place'
require_relative 'parser/move'
require_relative 'parser/right'
require_relative 'parser/left'
require_relative 'parser/report'

module ToyRobot
  module Command
    module Parser
      def self.parse(string)
        all.each do |parser|
          command = parser.build_with_match(string)
          return command if command
        end
        nil
      end

      def self.all
        constants(false).reject! { |const| const == :Base }.map { |const| const_get(const) }
      end
    end
  end
end
