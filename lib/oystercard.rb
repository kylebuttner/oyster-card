class Oystercard
  attr_reader :balance, :entry, :exit, :journeys, :journey

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE  = 2

  def initialize
    @balance = 0
    @journey = { entry: nil, exit: nil }
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
    @journey[:entry] = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey[:exit] = station
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
