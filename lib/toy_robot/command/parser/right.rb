require_relative 'base'

module ToyRobot
  module Command
    module Parser
      Right = Base.new(
        msg: :right,
        regex: /\ARIGHT\z/
      )
    end
  end
end
