require_relative 'base'

module ToyRobot
  module Command
    module Parser
      Move = Base.new(
        msg: :move,
        regex: /\AMOVE\z/
      )
    end
  end
end
