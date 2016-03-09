require 'journey'

describe Journey do
  subject(:journey) { described_class.new(entry_station) }
  let(:entry_station) { double(:station)}

  describe 'new journey' do
    it 'should initialize journey history' do
      expect(journey.entry_station).to eq entry_station
    end
    it 'should have no exit station' do
      expect(journey.exit_station).to be_nil
    end
  end

  describe 'journey status' do
    it 'should return journey status' do
      expect(journey.in_progress?).to eq true
    end
  end
end
