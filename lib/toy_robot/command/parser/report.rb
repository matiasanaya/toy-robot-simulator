require_relative 'base'

module ToyRobot
  module Command
    module Parser
      Report = Base.new(
        msg: :report,
        regex: /\AREPORT\z/
      )
    end
  end
end
