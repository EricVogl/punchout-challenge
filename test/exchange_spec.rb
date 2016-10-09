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
  end

end
