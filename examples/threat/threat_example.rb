$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'
require 'pry'

threat = ThreatFeed.threat.new
threat.id 1
threat.rank 0
threat.impact 0
threat.type "Example"
threat.name "Threat Example"
threat.tags ["Example", "Threat", "Tags"]
threat.tag "One more example tag!"
threat.signature "This is an example threat signature."
threat.indicator "This is an example threat indicator."
threat.description "This is an example threat description."
threat.intention "This is an example threat intention."
threat.capability "This is an example threat capability."

binding.pry
