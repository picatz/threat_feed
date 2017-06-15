$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'

include ThreatFeed

example_signature  = signature  { name "Example" }
example_indicator  = indicator  { name "Example" }
example_tag        = tag        { name "Example" }
example_capability = capability { name "Example" }
example_intention  = intention  { name "Example" }
example_type       = type       { name "Example" }

example_threat = threat do
  name "Example threat"
  tag  example_tag
  type example_type 
  smry "Examples for days."
  desc "Needed an example, so this threat is it."
  signature  example_signature
  indicator  example_indicator
  intention  example_intention
  capability example_capability
end

puts example_threat.to_json pretty: true
