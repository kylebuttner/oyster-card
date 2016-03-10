require 'journey'

describe Journey do

let(:aldgate) {double(:station, zone: 1)}
let(:kings_cross) {double(:station, zone: 3)}
let(:card) {double(:card, entrance: kings_cross, exit: aldgate)}

    it 'should know the journey start' do
      subject.start(kings_cross)
      expect(subject.entrance).to eq kings_cross
    end

    it 'should know the journey end' do
      subject.start(kings_cross)
      subject.end(aldgate)
      expect(subject.exit).to eq aldgate
    end

    it 'should return the zones crossed for a journey' do
      subject.start(kings_cross)
      subject.end(aldgate)
      expect(subject.zones_crossed).to eq 2
    end

end
