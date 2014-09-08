require './lib/toy_robot_simulator/command/command'

module Command
  module Matcher
    class Base
      def initialize(args)
        @regex = args[:regex]
        @token = args[:token]
        @args_extractor = args[:args_extractor]
      end

      def build_with_match(string)
        build_command(string) if match?(string)
      end

      private

      attr_reader :regex, :token, :args_extractor

      def match?(string)
        string =~ regex
      end

      def extract_args(string)
        if args_extractor
          args_extractor.call(string)
        end
      end

      def build_command(string)
        Command::Base.new(token, extract_args(string)) if match?(string)
      end
    end

    Move = Base.new(
      token: Command::Token::MOVE,
      regex: /\AMOVE\z/
    )

    Right = Base.new(
      token: Command::Token::RIGHT,
      regex: /\ARIGHT\z/
    )

    Left = Base.new(
      token: Command::Token::LEFT,
      regex: /\ALEFT\z/
    )

    Report = Base.new(
      token: Command::Token::REPORT,
      regex: /\AREPORT\z/
    )
  end
end
