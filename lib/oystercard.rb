class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE  = 2

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(amount)
    error = "Error, balance exceeds £#{MAX_LIMIT}!"
    raise error if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    @entry_station = station
    error = "Error insufficient funds"
    raise error if @balance < MIN_LIMIT
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    log
    @entry_station = nil
  end

  def log
    journey = [entry_station, exit_station]
    @journeys[entry_station] = exit_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
