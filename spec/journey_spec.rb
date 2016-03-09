require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  it { is_expected.to respond_to(:start).with(1).argument }
  it { is_expected.to respond_to(:finish).with(1).argument }
  it { is_expected.to respond_to(:complete?) }

  describe '#start' do
    it 'should store station as entry_station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
    it 'should return entry station' do
      expect(journey.start(entry_station)).to eq entry_station
    end
  end

  describe '#finish' do
    it 'should store station as exit_station' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
    it 'should return entry station' do
      expect(journey.finish(exit_station)).to eq exit_station
    end
  end

  describe '#complete?' do
    it 'should return false for an incomplete journey' do
      journey.start(entry_station)
      expect(journey.complete?).to eq false
    end
    it 'should return true for a complete journey' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.complete?).to eq true
    end
  end

  describe "#fare" do
    it 'should return  minimum fare for complete journey' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::MIN_FARE
    end
    it 'should return penalty fare for incomplete journey' do
      journey.start(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
