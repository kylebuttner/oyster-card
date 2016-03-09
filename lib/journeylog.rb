require_relative 'journey'

class Journeylog

  attr_reader :log, :journey

  def initialize
    @log = []
    @start = :nil
    @end = :nil
  end

  def start(station)
    # if @journey.class == Journey
    #   store_journey
    #   deduct(PEN_FARE)
    # end
    @journey = Journey.new
    @journey.start(station)
  end

  def end(station)
    # if @journey.class != Journey
    #   @journey = @journey_class.new
    #   @journey.end(station)
    #   deduct(PEN_FARE)
    # else
      @journey.end(station)
      # deduct
    #end
    store_journey
  end

  def store_journey
    @log << @journey
  end

  def fare
    @journey.complete? ? 1 : 6
    #((@end.zone) - (@start.zone))*@price_per_zone
  end

end
