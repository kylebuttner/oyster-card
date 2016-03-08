require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'

oyster = Oystercard.new(Journey)
aldgate = Station.new('aldgate', 2)
kings_cross = Station.new('kings cross', 1)
oyster.check_balance



oyster.top_up(20)

oyster.touch_in(aldgate, 'in')

oyster.touch_out(kings_cross, 'out')

p osyter.balance

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