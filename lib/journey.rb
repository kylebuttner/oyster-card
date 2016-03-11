class Journey
  attr_reader :entry_station, :exit_station, :current, :history
  
  def begin_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def reset
    @current = { entry: nil, exit: nil }
  end



  def complete?
    !!@entry_station && !!@exit_station
  end


end
