class JourneyLog

  attr_reader :history

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @history = []
  end

  def start(station)
    current_journey.begin_journey(station)
  end

  private

  def current_journey
    @history.empty? || @history.last.complete? ? @journey_class.new : @history.last
  end

end
