require 'minitest/autorun'
require_relative '../lib/exchange'

describe "Exchange" do
  let (:player1){ Player.new }
  let (:player2){ Player.new }

  describe "perform" do
    it "will damage both players if they both do basic attacks" do
      Exchange.perform(player1, player2, Move.new(MoveCode::JAB_LEFT), Move.new(MoveCode::JAB_RIGHT))
      player1.health.must_equal 8
      player2.health.must_equal 8
    end

    it "will damage the opposing player if only the first does a basic attack" do
      Exchange.perform(player1, player2, Move.new(MoveCode::JAB_LEFT), Move.new(MoveCode::ILLEGAL_MOVE))
      player1.health.must_equal 10
      player2.health.must_equal 8
    end
  end

end
