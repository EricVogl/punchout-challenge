require_relative 'move_code'
require_relative 'player'

class Exchange
  def self.perform(player1, player2, move1, move2)
    player1.dodge! if move1.is_evasive?
    player2.dodge! if move2.is_evasive?
    player1.defend! if move1.is_defensive?
    player2.defend! if move2.is_defensive?

    if move1.is_basic_attack? && move2.is_basic_attack?
      player1.take_hit!
      player2.take_hit!
    elsif move1.is_basic_attack? && move2.illegal?
      player2.take_hit!
    elsif move1.illegal? && move2.is_basic_attack?
      player1.take_hit!
    elsif move1.is_defensive? && move2.is_basic_attack?
      player1.award_star!
    elsif move1.is_basic_attack? && move2.is_defensive?
      player2.award_star!
    end
  end
end
