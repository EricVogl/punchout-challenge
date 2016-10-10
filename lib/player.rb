require_relative 'jsonable'

class Player < JSONable
  attr_reader :stamina, :health, :scores
  attr_accessor :stars

  def initialize(playerName = nil)
    @player_name = playerName
    @stamina = 10
    @health = 10
    @stars = 0
    @score = 0
  end

  def dodge!
    @stamina -= 1
    @stamina = [[10, @stamina].min, 0].max
  end

  def take_hit!
    @health -= 2
  end

  def defend!
    @stamina -= 2
    @stamina = [[10, @stamina].min, 0].max
  end

  def award_star!
    @stars += 1
    @stars = [[3, @stars].min, 0].max
  end

  def uppercut!
    @stars -= 3
    @stars = [[3, @stars].min, 0].max
  end

  def take_big_hit!
    @health -= 5
  end
end
