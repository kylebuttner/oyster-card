class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
  end

  def in_progress?
    @exit_station.nil?
  end

end
