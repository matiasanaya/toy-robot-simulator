require_relative 'base'

module ToyRobot
  module Command
    module Parser
      Left = Base.new(
        msg: :left,
        regex: /\ALEFT\z/
      )
    end
  end
end
