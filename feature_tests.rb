require './lib/oystercard.rb'

card = Oystercard.new

card.balance

card.top_up(10)

#should throw error for exceeding max top up
#card.top_up(81)

card.deduct(10)

card.in_journey?

card.touch_in

card.touch_out
