require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :entry, :exit, :journey_logs, :journey_log

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE  = 2

  def initialize(journey_log = JourneyLog)
    @balance = 0
    @journey_log = journey_log.new
  end

  def top_up(amount)
    error = "Error, balance exceeds £#{MAX_LIMIT}!"
    raise error if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    error = "Error insufficient funds"
    raise error if @balance < MIN_LIMIT
    if @journey_log.current[:entry] != nil
      @balance -= @journey.fare
    end
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.end(station)
    @balance -= journey_log.fare
    @journey_log.reset
  end
end
