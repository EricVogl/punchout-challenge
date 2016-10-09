require 'minitest/autorun'
require_relative '../lib/exchange'

describe "Exchange" do
  let (:player1){ Player.new }
  let (:player2){ Player.new }

  describe "perform" do
    MoveCode::BASIC_ATTACKS.each do |attack1|
      MoveCode::BASIC_ATTACKS.each do |attack2|
        it "will damage both players if they both do basic attacks, #{attack1} vs #{attack2}" do
          Exchange.perform(player1, player2, Move.new(attack1), Move.new(attack2))
          player1.health.must_equal 8
          player2.health.must_equal 8
        end
      end
    end

    MoveCode::BASIC_ATTACKS.each do |basic_attack|
      it "will damage the opposing player if only the first does a basic attack: #{basic_attack}" do
        Exchange.perform(player1, player2, Move.new(basic_attack), Move.new(MoveCode::ILLEGAL_MOVE))
        player1.health.must_equal 10
        player2.health.must_equal 8
      end
    end

    MoveCode::EVASIVE_MOVES.each do |evasive1|
      MoveCode::EVASIVE_MOVES.each do |evasive2|
        it "will drain stamina and not deal damage if both players dodge: #{evasive1} vs #{evasive2}" do
          Exchange.perform(player1, player2, Move.new(evasive1), Move.new(evasive2))
          player1.health.must_equal 10
          player2.health.must_equal 10
          player1.stamina.must_equal 9
          player2.stamina.must_equal 9
        end
      end
    end

    MoveCode::BASIC_ATTACKS.each do |attack|
      it "will drain stamina and award a star for defending against: #{attack}" do
        Exchange.perform(player1, player2, Move.new(MoveCode::DEFEND), Move.new(attack))
        player1.health.must_equal 10
        player1.stamina.must_equal 8
        player1.stars.must_equal 1
        player2.health.must_equal 10
      end
    end
  end
end
