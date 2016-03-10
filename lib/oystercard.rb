class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE  = 2

  def initialize
    @balance = 0
    @journey = {}
    @journeys = []
  end

  def top_up(amount)
    error = "Error, balance exceeds £#{MAX_LIMIT}!"
    raise error if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    error = "Error insufficient funds"
    raise error if @balance < MIN_LIMIT
    @journey[entry_station] = nil
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey[entry_station] = exit_station
    log
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def log
    @journeys << @journey
  end

end
