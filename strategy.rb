Dir['./lib/*.rb'].each { |f| require f }

include Aggressive
include Defensive

on_turn do
  handle_turn
end

def handle_turn
  if my.ammo >= 1
    act_aggressively target_enemy
  else
    act_defensively target_enemy
  end
end

def target_enemy
  opponents.first
end
