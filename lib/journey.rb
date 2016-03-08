class Journey

PRICE_PER_ZONE = 1
MIN_FAIR = 1

attr_reader :gate_status, :current

  def initialize
    @price_per_zone
    @current = Hash.new
    @history = []
    @gate_status = 'out'
  end

  def start(station, barrier)
      @gate =   
      @start = station  
  end

  def end(station, gate)
    @current  = Hash.new[@start] = station
    @start = nil
  end

  def fare
    1
    #((@end.zone) - (@start.zone))*@price_per_zone
  end

end