class State
  def initialize
    @history = []
    @my_name = nil
  end
  
  def save_battle(battle, me)
    @history << BattleState.new(battle)
    @my_name = me.username
  end
  
  def save_turn(turn)
    @history.last.turn = turn
  end
  
  def enough_history
    @history.length > 1
  end

  def me_now
    historical_me @history[-1].battle
  end

  def me_previous
    historical_me @history[-2].battle
  end
  
  def historical_me(battle)
    battle.robots.detect { |r| r.username == @my_name }
  end
  
  def just_hit_me?
    return false unless enough_history
    me_previous.armor > me_now.armor
  end
end

class BattleState
  attr_accessor :battle, :turn
  
  def initialize(battle)
    @battle = battle
  end
end