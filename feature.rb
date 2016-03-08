require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'

oyster = Oystercard.new
aldgate = Station.new
kings_cross = Station.new

oyster.check_balance


oyster.top_up(20)

oyster.touch_in('aldgate')

oyster.touch_out('kings_cross')

oyster.check_balance

p oyster.history



# oyster.deduct(18.70) check for min. balance
# oyster.touch_in
