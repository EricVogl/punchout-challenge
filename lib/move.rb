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
    @move_code.eql? MoveCode::ILLEGAL_MOVE
  end

  def is_evasive?
    MoveCode::EVASIVE_MOVES.include? @move_code
  end

  def is_defensive?
    @move_code.eql? MoveCode::DEFEND
  end

  def is_uppercut?
    @move_code.eql? MoveCode::UPPERCUT
  end

  def is_duck?
    @move_code.eql? MoveCode::DUCK
  end

  def is_body_blow?
    MoveCode::BODY_BLOW_ATTACKS.include? @move_code
  end

  def is_jab?
    MoveCode::JAB_ATTACKS.include? @move_code
  end

  def is_left_attack?
    MoveCode::LEFT_ATTACKS.include? @move_code
  end

  def is_right_attack?
    MoveCode::RIGHT_ATTACKS.include? @move_code
  end

  def is?(move_code)
    @move_code.eql? move_code
  end
end
