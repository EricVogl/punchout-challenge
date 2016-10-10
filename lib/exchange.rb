require_relative 'move_code'
require_relative 'player'

class Exchange
  def self.perform(player1, player2, move1, move2)
    resolve_for(player1, player2, move1, move2)
    resolve_for(player2, player1, move2, move1)
  end

  private

  # this method resolves the outcome from the perspective of "player"
  # call it twice and swap the parameters to resolve both players
  # this method helps reduce duplicate logic

  def self.resolve_for(player, opponent, player_move, opp_move)
    player.dodge! if player_move.is_evasive? && !opp_move.illegal?
    player.defend! if player_move.is_defensive? && !opp_move.is_evasive? && !opp_move.is_defensive?
    player.uppercut! if player_move.is_uppercut?
    player.award_star! if player_move.is_duck? && opp_move.is_jab?
    player.award_star! if player_move.is?(MoveCode::DODGE_LEFT) && opp_move.is_right_attack?
    player.award_star! if player_move.is?(MoveCode::DODGE_RIGHT) && opp_move.is_left_attack?
    player.take_hit! if player_move.is?(MoveCode::DODGE_LEFT) && opp_move.is_left_attack?
    player.take_hit! if player_move.is?(MoveCode::DODGE_RIGHT) && opp_move.is_right_attack?

    if player_move.is_basic_attack? && (opp_move.is_basic_attack? || opp_move.illegal?)
      opponent.take_hit!
    elsif player_move.is_defensive? && opp_move.is_basic_attack?
      player.award_star!
    elsif player_move.is_uppercut?
      if opp_move.is_defensive?
        opponent.take_hit!
      elsif !opp_move.is_defensive? && !opp_move.eql?(MoveCode::DUCK)
        opponent.take_big_hit!
        player.take_hit! if opp_move.is_basic_attack?
      end
    elsif player_move.is_body_blow?
      if opp_move.is_duck?
        opponent.take_hit!
        player.award_star!
      end
    end
  end
end
