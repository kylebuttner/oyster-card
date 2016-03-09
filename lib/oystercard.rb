class Oystercard
  DEFAULT_BALANCE = 0
  PEN_FARE = 6
  MAX_BALANCE = 90

  attr_reader :entrance, :exit, :journey, :journeylog

  def initialize(journeylog, balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @journeylog = journeylog.new
  end

  def check_balance
    @balance
  end

  def top_up(value)
    raise 'max out balance' if value + balance > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    @entrance
  end

  def touch_in(station)
    raise 'balance too low' if @balance <= Journey::MIN_FARE
    @journeylog.start(station)
  end

  def touch_out(station)
    @journeylog.end(station)
    deduct
  end

  private

  attr_reader :balance

  def deduct(value=@journeylog.fare)
      @balance -= value
      @balance
  end
end
