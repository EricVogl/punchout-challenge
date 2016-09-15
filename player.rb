require_relative 'jsonable'

class Player < JSONable
  def initialize(playerName)
    @player_name = playerName
    @stamina = 10
    @health = 10
    @stars = 0
    @score = 0
  end

  def dodge
    @stamina = @stamina - 1
    @stamina = [0, @stamina].min, 10
    @stamina = [10, @stamina].max
  end
end
