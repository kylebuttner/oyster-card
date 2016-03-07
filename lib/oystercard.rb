class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Exceeds maximum top up amount" if max_exceeded?(amount)
    @balance += amount
  end

  private

  def max_exceeded?(amount)
    @balance + amount > 90
  end

end
