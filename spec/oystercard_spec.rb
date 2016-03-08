require 'oystercard'

describe Oystercard do

let(:card) {Oystercard.new}

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

      expect{card.top_up(91)}.to raise_error(RuntimeError)
    end

    it 'raises error for total balance' do
      subject.top_up(80)
      expect{subject.top_up(20)}.to raise_error(RuntimeError)
    end
  end
  
  describe 'Card status' do
    it 'should change to "true"' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'should change to "false"' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'should raise error if balance < MIN_FAIR' do
      expect{card.touch_in}.to raise_error(RuntimeError)
    end

    it 'should deduct MIN_FAIR' do
      expect{card.touch_out}.to change{card.check_balance}.by(-1)
    end
  end
end
