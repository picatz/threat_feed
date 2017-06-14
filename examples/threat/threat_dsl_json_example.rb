$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'
require 'pry'

tag1 = ThreatFeed.tag do
  id 1
  type "Example"
  name "Threat Example"
  desc "This is a threat."
  smry "Needed example."
end

tag2 = ThreatFeed.tag do
  id 2
  type "Example"
  name "Threat Example"
  desc "This is also threat."
  smry "Needed example."
end

# Example of creating a threat using the DSL
threat = ThreatFeed.threat do
  id 1
  type "Example"
  name "Threat Example"
  tags [tag1, tag2]
  rank 0
  impact 0
  signature   "This is an example threat signature."
  indicator   "This is an example threat indicator."
  description "This is an example threat description."
  summary     "Example threat summary."
  intention   "This is an example threat intention."
  capability  "This is an example threat capability."
end

# store that json as a string
old_json = threat.to_json(pretty: true)

# make a new threat, which will mirror the threat we just created
threat2 = ThreatFeed.threat do
  from_json string: old_json
end

puts threat2.to_json(pretty: true)

