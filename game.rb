require './player.rb'
require './turn_manager.rb'

class Game
  def initialize
    @p1 = Player.new("Andrew")
    @p2 = Player.new("Rob")
    @turn_manager = TurnManager.new(self.players)
    @current_player = @p1
  end

  def players
    [@p1, @p2]
  end

  def summary
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
  end

  def game_over?
    players.any? {|p| p.dead? }
  end

  def find_winner
    players.select {|p| !p.dead? }.first
  end

  def next_round
    @round += 1
  end

  def swap_current_player
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end


  def score_summary
    puts "P1: #{@p1.lives}/3 vs. P2: #{@p2.lives}/3"
  end


  def run_script(turn)
    puts "========== New Turn =========="
    puts "#{@current_player.name}: Your turn, go!"
    puts turn.question
    @current_player.guess_number
    if turn.compare_guess_to_answer(@current_player)
      puts "Congratulations you can do addition, moving on now.."
    else
      puts "Seriously dude? No way, your math sucks!"
      @current_player.guess_wrong
    end
    score_summary
    swap_current_player
  end




  def run
    while !game_over?
      turn = @turn_manager.next_turn
      run_script(turn)
      sleep 0.5
    end
    puts "#{find_winner.name} wins with a score of #{find_winner.lives}/3!!!!! You go glen coco"
  end

end



