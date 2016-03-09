class Oystercard
  DEFAULT_BALANCE = 0
  PEN_FARE = 6


  attr_reader :entrance, :exit, :history, :journey, :balance

  def initialize(journey, balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @history = []
    @journey_class = journey
  end

  def check_balance
    @balance
  end

  def top_up(value)
    raise 'max out balance' if value + balance > 90
    @balance += value
  end

  def in_journey?
    @entrance
  end

  def touch_in(station)
    raise 'balance to low' if @balance <= Journey::MIN_FAIR
    if @journey.class == Journey
    store_journey
    deduct(PEN_FARE)
    end
    @journey= @journey_class.new
    @journey.start(station)
  end

  def touch_out(station)
    if @journey.class != Journey
      @journey= @journey_class.new
      @journey.end(station)
      deduct(PEN_FARE)
    else
    @journey.end(station)
    deduct
    end
    store_journey
  end

  def store_journey
        history << @journey
  end

  private

  

  def deduct(value=journey.fare)
      @balance -= value
      @balance
  end
end
