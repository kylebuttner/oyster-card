require_relative 'journey'

PEN_FARE = 6

class Journeylog

  attr_reader :log, :journey
  attr_accessor :deduct
  def initialize
    @log = []
    @journey = nil
    @complete = nil
    @deduct = false
    @current = {}
  end

  def start(station)
    if @journey != nil
      current_journey
      store_journey
      @deduct = true
    end
    current_journey
    @journey.start(station)
  end

  def finish(station)
    if @journey == nil
      current_journey
    end
      @journey.end(station)
      @current[@journey.entrance] = @journey.end(station)
      store_journey
      @deduct = true
  end

  def journeys
    @log
  end

  def store_journey
    @fare = @journey.complete? ? 1 : 6
    @log << @current
    @journey = nil
    @current = {}
  end

  def fare
    @fare
  end

  def deduct?
    @deduct
  end

private

  def current_journey
    if @journey != nil
      @current[@journey.entrance] = nil
      else
        @journey = Journey.new
    end
  end
end
