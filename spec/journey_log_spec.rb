require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new(journey_class = Journey.new) }

  let(:entry_station) { double(:station)}

  it { is_expected.to respond_to(:start).with(1).argument}
  it { is_expected.to respond_to(:finish).with(1).argument }

  describe 'initialize' do
    it 'should receive a Journey_class parameter' do
      expect(journey_log.journey_class).to be_a(Journey)
    end
  end
end
