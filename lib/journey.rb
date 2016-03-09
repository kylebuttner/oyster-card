class Journey

  attr_reader :entry_station, :exit_station, :fare

  MIN_FARE = 1
  PENALTY_FARE = 6

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  def fare
    complete? ? @fare = MIN_FARE : @fare = PENALTY_FARE
  end
end
