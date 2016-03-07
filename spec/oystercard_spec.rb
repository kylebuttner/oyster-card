require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe "new card" do

    it "should have a balance of zero" do
      expect(oystercard.balance).to eq(0)
    end

  end

  describe "#top_up" do

    it "should top up card" do
       expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10
    end

    it "should throw error when top up exceeds maximum amount" do
      error_message = "Exceeds £#{Oystercard::MAX_AMOUNT} top up limit"
      expect{ oystercard.top_up 91 }.to raise_error error_message
    end

  end

  describe "#deduct" do

    it "deducts fare from balance" do
      oystercard.top_up(10)
      expect {oystercard.deduct(5)}.to change{ oystercard.balance}.by -5
    end
  end

  describe "journey status" do

    it 'should display journey status' do
      expect(oystercard.in_journey?).to eq(false)
    end

    it 'should be true after touch in' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq(true)
    end

    it 'should be false after touch out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq(false)
    end

  end

end
