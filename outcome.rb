require_relative 'jsonable'

class Outcome < JSONable

  def initialize(health_change = 0, stamina_change = 0, star_change = 0, knocked_down = false, knocked_down_time = 0, game_over = false, end_condition = nil)
    @health_change = health_change
    @stamina_change = stamina_change
    @knocked_down = knocked_down
    @knocked_down_time = knocked_down_time
    @game_over = game_over
    @end_condition = end_condition
  end
end
