#!/usr/bin/env ruby -wU

require_relative './boot'

require_relative './speedtest'

speedtest = SpeedTest.new

print 'Looking for the best server... '
best = speedtest.best_server
puts 'done'
puts "Best server is #{best['Description']}"

print 'Testing... '
results = speedtest.run_test(best)
puts 'done'
puts "Test results:\n#{results}"

csv = speedtest.export_csv(results)
puts csv
