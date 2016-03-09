class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << current_journey
    current_journey.start(station)
  end

  def finish(station)
    @journeys << current_journey
    current_journey.finish(station)
  end

private

    def current_journey
      (@journeys.empty? || @journeys[-1].complete?) ? journey_class.new : @journeys[-1]
    end

end
