require_relative './lib/oystercard.rb'

oyster = Oystercard.new
aldgate = station
oyster.check_balance


oyster.top_up(20)

oyster.deduct(1.30)

osyter.touch_in aldgate

oyster.touch_out

oyster.check_balance

# oyster.deduct(18.70) check for min. balance
# oyster.touch_in
