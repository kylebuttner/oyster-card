class Oystercard
  DEFAULT_BALANCE = 0
  MIN_FAIR = 1

  attr_reader :entrance, :exit, :journey, :history

  def initialize(_balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @history = []
    @journey = Hash.new
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
    @entrance = station
  end

  def touch_out(station)
    deduct
    @exit = station
    store_journey
  end

  def store_journey
    journey[@entrance] = @exit
    @history << @journey
    @entrance = nil
    #@exit = nil
  end

  private

  attr_reader :balance

  def deduct(value = MIN_FAIR)
    @balance -= value
  end
end
