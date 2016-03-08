class Oystercard
  DEFAULT_BALANCE = 0


  attr_reader :entrance, :exit, :history, :journey

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

  def touch_in(station, gate)
    raise 'balance to low' if @balance <= Journey::MIN_FAIR
    @journey= @journey_class.new
    if journey.gate_status == gate
    touch_out(station, out)
    else
    @journey.start(station, gate)
    end
  end

  def touch_out(station, gate)
    @journey.end(station, gate)
    store_journey
    deduct
  end

  def store_journey
        history << @journey.current
  end

  private

  attr_reader :balance

  def deduct
    if journey.current.include? nil
      @balance -=6
    else
      @balance -= journey.fare
    end
      @balance
  end
end
