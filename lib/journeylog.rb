require_relative 'journey'

PEN_FARE = 6

class Journeylog

  attr_reader :log, :journey
  attr_accessor :deduct
  def initialize
    @log = []
    @start = :nil
    @end = :nil
    @journey = nil
    @complete = nil
    @deduct=false
  end

  def start(station)
    if @journey == nil
      @journey = Journey.new
      @journey.start(station)
    else 
      store_journey
      @deduct = true
      @journey = Journey.new
      @journey.start(station)
    end
  end

  def finish(station)
    if @journey == nil
      @journey = Journey.new
      @journey.end(station)
      store_journey
      @deduct = true
    else
      @journey.end(station)
      store_journey
      @deduct = true
    end
  end

  def journeys
    @log
  end

  def store_journey
    @fare = @journey.complete? ? 1 : 6
    @log << @journey
    @journey = nil
  end

  def fare
    @fare
    
    #((@end.zone) - (@start.zone))*@price_per_zone
  end

  def deduct?
    @deduct
  end

private

  def current_journey
    if @journey != nil
      return @journey
      else 
        @journey = Journey.new
    end
  end
end