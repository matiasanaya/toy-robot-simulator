require_relative 'command/command'
require 'forwardable'

class RobotController
  extend Forwardable

  def_delegators :robot, :place, :move, :left, :right
  def_delegator :view, :report

  def initialize(args)
    @robot = args[:robot]
    @view = args[:view]
  end

  def input(command)
    case command.token
    when Command::Token::PLACE
      place(command.args)
    when Command::Token::MOVE
      move
    when Command::Token::RIGHT
      right
    when Command::Token::LEFT
      left
    when Command::Token::REPORT
      report
    end
  end

  private

  attr_reader :robot, :view
end
