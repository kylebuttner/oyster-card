require 'pry'
require_relative './lib/oystercard.rb'
require_relative './lib/station.rb'
require_relative './lib/journey.rb'
require_relative './lib/journeylog.rb'

o = Oystercard.new
s1 = Station.new('aldgate', 2)
s2 = Station.new('kings cross', 1)

o.top_up 60
o.touch_in s1
o.touch_out s2
