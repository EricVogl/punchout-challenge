require_relative 'move_code'
require_relative 'jsonable'

class Move < JSONable
  def initialize(move_code = nil)
    @move_code = move_code
  end
end
