Dir['./lib/*.rb'].each { |f| require f }

include Aggressive
include Defensive

@state = State.new

on_turn do
  @state.save_battle(battle, me)
  turn = handle_turn
  @state.save_turn(turn)
  turn
end

def handle_turn
  return act_defensively target_enemy if @state.just_hit_me?
  return act_aggressively target_enemy if my.ammo >= 1 || (@state.enough_history && @state[-1].turn == 'defense' && @state[-2].turn == 'defense')
  act_defensively target_enemy
end

def target_enemy
  opponents.first
end
