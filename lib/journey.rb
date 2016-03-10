class Journey
  attr_reader :entry, :exit, :current, :history

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current = { entry: nil, exit: nil }
    @history = []
  end

  def begin_journey(station)
    @current[:entry] = station
  end

  def end_journey(station)
    @current[:exit] = station
    log
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    if current[:entry] != nil && current[:exit] != nil
     true
   else
    false
    end
  end

  private

  def log
    @history << @current
  end



end