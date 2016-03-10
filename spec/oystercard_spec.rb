require 'oystercard'

describe Oystercard do

  let(:journey_class) { double(:journey_class, new: journeylog) }
  let(:journey) {double(:journey, start: entrance_stat, end: exit_stat)}
  let(:card) { described_class.new(journey_class) }
  let(:entrance_stat) { double(:station) }
  let(:exit_stat) { double(:station) }
  let(:journeylog) { double(:journeylog, deduct?: true, start: entrance_stat, finish: exit_stat, fare: 1)}

  describe 'Balance' do
    it 'starts with a balance of 0' do
      expect(card.balance).to eq 0
    end
  end

  describe 'Top-up' do
    it 'should return the value it was top-uped with' do
      expect(card.top_up(20)).to eq 20
    end

    it 'raises error for top-sum' do
      expect { card.top_up(91) }.to raise_error(RuntimeError)
    end

    it 'raises error for total balance' do
      card.top_up(80)
      expect { card.top_up(20) }.to raise_error(RuntimeError)
    end
  end

  describe 'touch in' do
    it 'should raise error if balance < MIN_FARE' do
      expect { card.touch_in(entrance_stat) }.to raise_error(RuntimeError)
    end

  end

  describe 'touch out' do

    it 'should deduct MIN_FARE' do
      card.top_up(5)
      card.touch_in(entrance_stat)
      expect { card.touch_out(exit_stat) }.to change { card.balance }.by(-1)
    end
  end

end
