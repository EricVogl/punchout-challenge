require_relative 'move_code'
require_relative 'player'

class Exchange
  def self.perform(player1, player2, move1, move2)
    if move1.is_basic_attack? && move2.is_basic_attack?
      player1.take_hit!
      player2.take_hit!
    elsif move1.is_basic_attack? && move2.illegal?
      player2.take_hit!
    elsif move1.illegal? && move2.is_basic_attack?
      player1.take_hit!
    end
  end
end
