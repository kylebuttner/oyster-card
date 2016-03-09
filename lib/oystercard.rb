class Oystercard
  attr_reader :balance, :entry, :exit, :journey_log

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE  = 2

  def initialize
    @balance = 0
    @journey_log = {}
  end

  def top_up(amount)
    error = "Error, balance exceeds £#{MAX_LIMIT}!"
    raise error if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    !!@entry
  end

  def touch_in(station)
    @entry = station
    error = "Error insufficient funds"
    raise error if @balance < MIN_LIMIT
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit = station
    journey
    @entry = nil
  end

  def journey
    @journey_log[entry] = exit
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
