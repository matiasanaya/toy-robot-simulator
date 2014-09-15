require 'ostruct'

module ToyRobot
  module Command
    module Parser
      class Base
        def initialize(args)
          @regex = args[:regex]
          @msg = args[:msg]
          @args_extractor = args[:args_extractor]
        end

        def build_with_match(string)
          build_command(string) if match?(string)
        end

        private

        attr_reader :regex, :msg, :args_extractor

        def match?(string)
          string =~ regex
        end

        def extract_args(string)
          if args_extractor
            args_extractor.call(string)
          end
        end

        def build_command(string)
          OpenStruct.new(msg: msg, args:extract_args(string)) if match?(string)
        end
      end

      Move = Base.new(
        msg: :move,
        regex: /\AMOVE\z/
      )

      Right = Base.new(
        msg: :right,
        regex: /\ARIGHT\z/
      )

      Left = Base.new(
        msg: :left,
        regex: /\ALEFT\z/
      )

      Report = Base.new(
        msg: :report,
        regex: /\AREPORT\z/
      )
    end
  end
end
