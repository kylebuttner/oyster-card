require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe "new card" do

    it "should have a balance of zero" do
      expect(oystercard.balance).to eq(0)
    end

    it "should top up card" do
       expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end

  end

end
