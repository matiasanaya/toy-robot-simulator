module Command
  module Token
    PLACE = :PLACE
    MOVE = :MOVE
    RIGHT = :RIGHT
    LEFT = :LEFT
    REPORT = :REPORT
  end

  Base = Struct.new(:token, :args)
end
