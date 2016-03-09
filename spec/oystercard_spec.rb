require 'oystercard'

describe Oystercard do

  let(:journey_class) { double(:journey_class, new: journey) }
  let(:journey) {double(:journey, start: entrance_stat, end: exit_stat, class: Journey, fare: 1)}
  let(:card) { described_class.new(journey_class) }
  let(:entrance_stat) { double(:station) }
  let(:exit_stat) { double(:station) }
  describe 'Balance' do
    it 'starts with a balance of 0' do
      expect(card.check_balance).to eq 0
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
    it 'should raise error if balance < MIN_FAIR' do
      expect { card.touch_in(entrance_stat) }.to raise_error(RuntimeError)
    end

    it 'remembers the station' do
      card.top_up(5)
      card.touch_in entrance_stat
      expect(card.journey.start).to eq entrance_stat
    end
  end

  describe 'touch out' do
    it 'should change to "false"' do
      card.top_up(10)
      card.touch_in entrance_stat
      card.touch_out exit_stat
      expect(card).not_to be_in_journey
    end

    it 'remembers the station' do
      card.top_up(10)
      card.touch_in entrance_stat
      card.touch_out(exit_stat)
      expect(card.journey.end).to be exit_stat
    end

    it 'should deduct MIN_FAIR' do
      card.top_up(5)
      card.touch_in(entrance_stat)
      expect { card.touch_out(exit_stat) }.to change { card.check_balance }.by(-1)
    end
  end

  describe 'Journey Hist.' do
    it 'should be empty by default' do
      expect(card.history).to be_empty
    end

    it 'should create a journey' do
      card.top_up(10)
      card.touch_in(entrance_stat)
      card.touch_out(exit_stat)
      expect(card.history).to include(journey)
    end
  end

end
