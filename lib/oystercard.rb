class Oystercard
  DEFAULT_BALANCE = 0
  MIN_FAIR = 1

  attr_reader :entrance
  def initialize(_balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
  end

  def check_balance
    @balance
  end

  def top_up(value)
    raise 'max out balance' if value + balance > 90
    @balance += value
  end

  def in_journey?
    @entrance
  end

  def touch_in(station)
    raise 'balance to low' if @balance <= MIN_FAIR
    @status = true
    @entrance = station
  end

  def touch_out
    deduct
    @status = false
    @entrance = nil
  end

  private

  attr_reader :balance

  def deduct(value = MIN_FAIR)
    @balance -= value
  end
end
