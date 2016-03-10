class Journey

PRICE_PER_ZONE = 1

attr_reader :entrance, :exit

  def initialize
    @price_per_zone
    @entrance = :nil
    @exit = :nil
  end

  def start(station)
    @entrance = station
  end

  def end(station)
    @exit = station
  end

  def complete?
    if @entrance == :nil && @exit != :nil
      false
    elsif @entrance != :nil && @exit == :nil
      false
    else
      true
    end
  end

end
