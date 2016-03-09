class Oystercard

  CARD_LIMIT = 90
  MIN_AMOUNT = 1

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
    @current_journey = Journey.new
    # fail "This card is already in journey." if in_journey?
    fail "Card balance is too low." if below_min?
    @current_journey.start(station)
    @journey_log << @current_journey
    increment_journey_index
    @journeys[journey_index] = { :in => station }                                                  # does this violate SRP?
  end

  def touch_out(station)
    @journey_log << (@current_journey = Journey.new) if @journey_log.empty?
    if @journey_log[-1].exit_station.nil?
      @journey_log[-1].finish(station)
    else
      @journey_log << (@current_journey = Journey.new)
      @journey_log.finish(station)
    end
    deduct(@current_journey.fare)
  end

  def increment_journey_index
    @journey_index += 1
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
