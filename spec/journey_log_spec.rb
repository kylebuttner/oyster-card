require 'journey_log'

describe JourneyLog do
  let (:journey_class_factory) { double(:journey_class_factory, new: current_journey) }
  let (:current_journey) { double(:current_journey) }
  subject(:journey_log) { described_class.new(journey_class_factory) }
  let(:station) { double :station }

  describe "initialize" do
    it 'should accept a journey_class parameter' do
      expect(journey_log.current_journey).to eq current_journey
    end
  end

  describe '#start' do
    it 'begins a journey with an entry station' do
      expect(current_journey).to receive :begin_journey
      journey_log.start(station)
    end
  end
end
