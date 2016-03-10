class Journey

PRICE_PER_ZONE = 1

attr_reader :entrance, :exit, :zones_crossed

  def initialize
    @entrance = :nil
    @exit = :nil
    @zones_crossed = 0
  end

  def start(station)
    @entrance = station
  end

  def end(station)
    @exit = station
    @zones_crossed = (@entrance.zone - @exit.zone).abs if complete?
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
