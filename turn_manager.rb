class TurnManager

  def initialize(players)
    @players = players.dup
  end

  def next_turn
    p1 = get_p1
    p2 = get_p2
    Turn.new(p1, p2)
  end

  def get_p1
    @players.first
  end

  def get_p2
    @players.last
  end

end


class Turn

  attr_accessor :p1, :p2, :answer

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def question
    num1 = rand(10)
    num2 = rand(10)
    @answer = num1 + num2
    puts "What does #{num1} + #{num2} equal?"
  end

  def compare_guess_to_answer(player)
    player.guess == @answer
  end

end