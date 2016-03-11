require 'journey_log'

describe JourneyLog do
  let (:journey_class_factory) { double(:journey_class_factory, new: journey_class) }
  let (:journey_class) { double(:journey_class) }
  subject(:journey_log) { described_class.new(journey_class_factory) }

  describe "initialize" do
    it 'should accept a journey_class parameter' do
      expect(journey_log.journey_class).to eq journey_class
    end
  end
end
