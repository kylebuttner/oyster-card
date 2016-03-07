class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Exceeds £#{Oystercard::MAX_AMOUNT} top up limit" if max_exceeded?(amount)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  private

    def max_exceeded?(amount)
      @balance + amount > MAX_AMOUNT
    end

end
