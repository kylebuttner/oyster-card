class Oystercard

  CARD_LIMIT = 90
  MIN_AMOUNT = 1
  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :journey_log, :journey_index, :current_journey

  def initialize
    @balance = 0
    @journey_log = []
    @journey_index = 0
  end

  def top_up(amount)
    fail "Card balance may not exceed £#{CARD_LIMIT}" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Card balance is too low." if below_min?
    @journey_log << Journey.new
    deduct(journey_log[-2].fare) if @journey_log.count >=2 && !@journey_log[-2].complete?
    @journey_log[-1].start(station)
    increment_journey_index
    @journeys[journey_index] = { :in => station }                                                  # does this violate SRP?
  end

  def touch_out(station)
    @journey_log << Journey.new if @journey_log.empty?
    if @journey_log[-1].exit_station.nil?
      @journey_log[-1].finish(station)
    else
      @journey_log << Journey.new
      @journey_log[-1].finish(station)
    end
    deduct(@journey_log[-1].fare)
  end

  def increment_journey_index
    @journey_index += 1
  end

  def previous_journey_complete?
    !!@journey_log[-1].exit_station && !!@journey_log[-1].entry_station
  end

  private

    def in_journey?
      !@current_journey.complete?
    end

    def exceeds_max?(amount)
      amount + balance > CARD_LIMIT
    end

    def below_min?
      @balance < MIN_AMOUNT
    end

    def deduct(amount)
      @balance -= amount
    end
end
