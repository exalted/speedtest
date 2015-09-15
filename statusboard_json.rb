#!/usr/bin/env ruby -wU

require_relative './boot'

require 'json'

ping_datapoints = []
down_datapoints = []
up_datapoints = []

lines = File.read('output.csv').lines[1..-1]
lines.each do |row|
  data = row.split(';')

  title = data[0..1].join

  ping_value = data[2].tr(',', '.').to_f
  down_value = data[4].tr(',', '.').to_f
  up_value   = data[6].tr(',', '.').to_f

  ping_datapoints.push('title': title, 'value': ping_value)
  down_datapoints.push('title': title, 'value': down_value)
  up_datapoints  .push('title': title, 'value': up_value)
end

output = {
  'graph': {
    'title': 'Speed Test',
    'type': 'line',
    # 'xAxis': {
    #   'showEveryLabel': true
    # },
    # 'yAxis': {
    #   'scaleTo': 1
    # },
    'datasequences': [
      # {
      #   'title': 'Ping',
      #   'datapoints': ping_datapoints
      # },
      {
        'title': 'Download (Mb/s)',
        'datapoints': down_datapoints
      },
      {
        'title': 'Upload (Mb/s)',
        'datapoints': up_datapoints
      }
    ]
  }
}

puts output.to_json
