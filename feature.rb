require 'pry'
require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'
require_relative './lib/journeylog.rb'

oyster = Oystercard.new(Journeylog)
aldgate = Station.new('aldgate', 2)
kings_cross = Station.new('kings cross', 1)
journeylog = Journeylog.new
oyster.check_balance



oyster.top_up(5)



oyster.touch_in(aldgate)

oyster.touch_out(kings_cross)

p oyster.check_balance

#binding.pry
p oyster.journeylog.log


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
