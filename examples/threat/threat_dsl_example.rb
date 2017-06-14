$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'threat_feed'
require 'pry'

# Create an example tag type
example_tag = ThreatFeed.type do
  id 1
  name "Tag Example"
  desc "This is is a threat tag example."
  smry "Needed example."
end

# Create an example signature
example_signature = ThreatFeed.signature do
  id 31337
  name "Signature Example"
  desc "This is is a threat signature example."
  smry "Needed example."
end

# Create an example threat type
example_threat = ThreatFeed.type do
  id 1
  name "Type Example"
  desc "This is a example threat feed type."
  smry "Needed example."
end

# Create a tag
tag1 = ThreatFeed.tag do
  id 1
  type example_tag
  name "Threat Example"
  desc "This is a threat."
  smry "Needed example."
end

# Create a second tag
tag2 = ThreatFeed.tag do
  id 2
  type example_tag
  name "Threat Example"
  desc "This is also threat."
  smry "Needed example."
end

# Example of creating a threat using the DSL
threat = ThreatFeed.threat do
  id 1
  name "Threat Example"
  type example_threat
  tags [tag1, tag2]
  rank 0
  impact 0
  signature   example_signature
  indicator   "This is an example threat indicator."
  description "This is an example threat description."
  summary     "Example threat summary."
  intention   "This is an example threat intention."
  capability  "This is an example threat capability."
end

puts threat.to_json(pretty: true)

