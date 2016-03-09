require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'

oyster = Oystercard.new(Journey)
aldgate = Station.new('aldgate', 2)
kings_cross = Station.new('kings cross', 1)
oyster.check_balance



oyster.top_up(20)



oyster.touch_in(aldgate)

oyster.touch_in(kings_cross)

oyster.touch_out(aldgate)

p oyster.balance

p oyster.history

=begin
oyster.balance

journey.price(oyster.entrance, oyster.exit)


oyster.deduct(journey.price)

oyster.balance

aldgate.name
kings_cross.zone


# oyster.deduct(18.70) check for min. balance
# oyster.touch_in
=end