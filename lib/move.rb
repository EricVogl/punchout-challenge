require_relative 'move_code'
require_relative 'jsonable'

class Move < JSONable
  def initialize(move_code = nil)
    @move_code = move_code
  end

  def is_basic_attack?
    MoveCode::BASIC_ATTACKS.include? @move_code
  end

  def illegal?
    return @move_code.eql? MoveCode::ILLEGAL_MOVE
  end
end
