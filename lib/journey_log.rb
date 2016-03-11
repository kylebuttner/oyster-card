class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class = Journey)
    @current_journey = journey_class.new
  end

  def start(station)
    @current_journey.begin_journey(station)
  end
end
