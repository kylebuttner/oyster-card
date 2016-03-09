class Journey

PRICE_PER_ZONE = 1
MIN_FARE = 1

  def initialize
    @price_per_zone
    @start = :nil
    @end = :nil
  end

  def start(station)
    @start = station
  end

  def end(station)
    @end = station
  end

  def complete?
    true
  end

end
