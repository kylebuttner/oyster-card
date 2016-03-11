require 'journey_log'

describe JourneyLog do
  let (:journey_class_factory) { double(:journey_class_factory, new: journey_class) }
  let(:journey_class) { double(:journey_class, begin_journey: station, end_journey: station2)}
  subject(:journey_log) { described_class.new(journey_class_factory) }
  let(:station) { double :station }
  let(:station2) { double :station}
  let(:history) {{ entry: station, exit: station2}}


  describe "initialize" do
    # it 'should accept a journey_class parameter' do
    #   expect(journey_log.current_journey).to eq current_journey
    # end

    it 'should create an empty journey history' do
      expect(journey_log.journeys).to be_empty
    end
  end

  describe '#start' do
    it 'begins a journey with an entry station' do
      journey_log.start(station)
      expect(journey_log.journeys).not_to be_empty
    end
  end

  describe '#end' do
    it 'ends the journey with an exit station' do
      allow(journey_class).to receive(:complete?).and_return true
      journey_log.start(station)
      journey_log.end(station)
      expect(journey_log.journeys.count).to eq 2
    end

    it 'should push journey into history' do
      allow(journey_class).to receive(:complete?).and_return true
      journey_log.start(station)
      journey_log.end(station2)
      expect(journey_log.journeys.last).to eq journey_class
    end
  end

  describe '#journeys' do
    it 'returns a duplicate of the journey history' do
      allow(journey_class).to receive(:complete?).and_return true
      journey_log.start(station)
      journey_log.end(station2)
      expect(journey_log.journeys).to be_an(Array)
    end
  end

  describe "#previous_journey_incomplete?" do
    it 'returns whether previous journey was completed' do
      allow(journey_class).to receive(:complete?).and_return true
      journey_log.start(station)
      journey_log.end(station)
      expect(journey_log.previous_journey_incomplete?).to be false
    end
  end
end
