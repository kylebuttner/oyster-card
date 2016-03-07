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
      error_message = "Exceeds maximum top up amount"
      expect{ oystercard.top_up 91 }.to raise_error error_message
    end

  end


end
