require_relative 'jsonable'

class Turn < JSONable
  def initialize(p1_move, p2_move, p1_outcome, p2_outcome)
    @p1_move = p1_move
    @p2_move = p2_move
    @p1_outcome = p1_outcome
    @p2_outcome = p2_outcome
  end
end
