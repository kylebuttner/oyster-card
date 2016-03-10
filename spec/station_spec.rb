require 'station'

describe Station do
  describe '#initialize' do
    let (:zone) { double :zone }
    let (:station1) { double :station }
    it 'initializes with the name value' do
      station = Station.new(station1, zone)
      expect(station.name).to eq station1
    end

    it 'initializes with the zone value' do
      station = Station.new(station1, zone)
      expect(station.zone).to eq zone
    end
  end
end
