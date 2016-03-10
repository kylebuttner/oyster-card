require 'journeylog'

describe Journeylog do

  let(:aldgate) {double(:station, zone: 1)}
  let(:kings_cross) {double(:station, zone: 3)}

  it 'initializes with an empty history' do
    expect(subject.journeys).to be_empty
  end

  describe 'Price' do
    it 'should calculate a price for a journey' do
      subject.start(kings_cross)
      subject.finish(aldgate)
      expect(subject.fare).to eq 3
    end
  end
end
