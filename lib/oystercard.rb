class Oystercard

DEFAULT_BALANCE = 0
MIN_FAIR = 1

  def initialize(balance=DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @status = false
  end

  def check_balance
    @balance
  end

  def top_up(value)
    raise 'max out balance' if value + balance > 90
    @balance += value
  end

  def in_journey?
    @status
  end

  def touch_in
    raise "balance to low" if @balance<= MIN_FAIR
    @status= true
  end

  def touch_out
    deduct
    @status= false
  end

private

  def balance
    @balance
  end

    def deduct(value=MIN_FAIR)
    @balance -= value
  end

end
