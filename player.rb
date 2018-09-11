class Player
  attr_reader :guess, :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def guess_number
    guess = gets.chomp.to_i
    @guess = guess
  end

  def dead?
    @lives <= 0
  end

  def guess_wrong
    @lives -= 1
  end

end