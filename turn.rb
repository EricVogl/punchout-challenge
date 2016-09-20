require_relative 'jsonable'
require_relative 'move'
require_relative 'outcome'

class Turn < JSONable
  def initialize(p1_move = nil, p2_move = nil, p1_outcome = nil, p2_outcome = nil)
    @p1_move = p1_move
    @p2_move = p2_move
    @p1_outcome = p1_outcome
    @p2_outcome = p2_outcome
  end

  def from_json! string
      hash = JSON.parse(string)
      @p1_move = Move.new
      @p1_move.from_json! hash["p1_move"].to_json
      @p2_move = Move.new
      @p2_move.from_json! hash["p2_move"].to_json
      @p1_outcome = Outcome.new
      @p1_outcome.from_json! hash["p1_outcome"].to_json
      @p2_outcome = Outcome.new
      @p2_outcome.from_json! hash["p2_outcome"].to_json
  end
end
