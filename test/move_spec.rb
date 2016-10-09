require 'minitest/autorun'
require_relative '../lib/move'

describe "Move" do

  [MoveCode::JAB_LEFT, MoveCode::JAB_RIGHT, MoveCode::LEFT_BODY_BLOW, MoveCode::RIGHT_BODY_BLOW].each do |move_code|
    it "#{move_code} is a basic attack" do
      Move.new(move_code).is_basic_attack?.must_equal true
    end
  end

  [MoveCode::DODGE_LEFT, MoveCode::DODGE_RIGHT, MoveCode::DEFEND, MoveCode::DUCK, MoveCode::UPPERCUT, MoveCode::ILLEGAL_MOVE].each do |move_code|
    it "#{move_code} is not a basic attack" do
      Move.new(move_code).is_basic_attack?.must_equal false
    end
  end
end
