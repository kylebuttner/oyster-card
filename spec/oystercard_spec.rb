require 'oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:entrance_stat) { double(:station) }
  let(:exit_stat) { double(:station) }
  let(:journey) {{entrance_stat => exit_stat} }
  describe 'Balance' do
    it 'starts with a balance of 0' do
      expect(subject.check_balance).to eq 0
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
      subject.top_up(80)
      expect { subject.top_up(20) }.to raise_error(RuntimeError)
    end
  end

  describe 'touch in' do
    it 'should change to "true"' do
      subject.top_up(10)
      subject.touch_in entrance_stat
      expect(subject).to be_in_journey
    end

    it 'should raise error if balance < MIN_FAIR' do
      expect { card.touch_in(entrance_stat) }.to raise_error(RuntimeError)
    end

    it 'remembers the station' do
      subject.top_up(5)
      subject.touch_in entrance_stat
      expect(subject.entrance).to eq entrance_stat
    end
  end

  describe 'touch out' do
    it 'should change to "false"' do
      subject.top_up(10)
      subject.touch_in entrance_stat
      subject.touch_out exit_stat
      expect(subject).not_to be_in_journey
    end

    it 'remembers the station' do
      subject.top_up(10)
      subject.touch_in entrance_stat
      subject.touch_out(exit_stat)
      expect(subject.exit).to be exit_stat
    end

    it 'should deduct MIN_FAIR' do
      expect { card.touch_out(exit_stat) }.to change { card.check_balance }.by(-1)
    end
  end

  describe 'Journey Hist.' do
    it 'should be empty by default' do
      expect(subject.journey).to be_empty
    end

    it 'should create a journey' do 
      subject.top_up(10)
      subject.touch_in(entrance_stat)
      subject.touch_out(exit_stat)
      expect(subject.history).to include(journey)
    end
  end

end
