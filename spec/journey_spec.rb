require 'journey'

describe Journey do
  let(:journey) { described_class.new }
  let(:current) {{ entry: nil, exit: nil}}
  let(:station) { double :station }
  let(:station2) { double :station2 }
  let(:current2) {{ entry: station, exit: station2}}
  let(:card) { double:card}

  describe '#begin_journey' do
    it 'sets an entry station' do
      journey.begin_journey(station)
      expect(journey.entry_station).to eq station
    end
  end

  describe '#end_journey' do
    it 'sets an exit station' do
      journey.begin_journey(station)
      journey.end_journey(station2)
      expect(journey.exit_station).to eq station2
    end

  end

  # describe '#fare' do
  #   it 'charges minimum fare if current journey complete' do
  #     journey.begin_journey(station)
  #     journey.end_journey(station2)
  #     expect(journey.
  # end
end
