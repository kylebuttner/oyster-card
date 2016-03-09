class Journey

PRICE_PER_ZONE = 1
MIN_FAIR = 1

attr_reader :gate_status, :current

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

  def fare
    1
    #((@end.zone) - (@start.zone))*@price_per_zone
  end

end