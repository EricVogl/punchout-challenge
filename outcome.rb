require_relative 'jsonable'

class Outcome < JSONable

  def initialize(health_change, stamina_change, star_change, knocked_down, knocked_down_time, game_over, end_condition)
    @health_change = health_change
    @stamina_change = stamina_change
    @knocked_down = knocked_down
    @knocked_down_time = knocked_down_time
    @game_over = game_over
    @end_condition = end_condition
  end
end
