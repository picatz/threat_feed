$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'

include ThreatFeed

tag_pool = element_pool do
  pool_type :tag
end

signature_pool = element_pool do
  pool_type :signature
end

indicator_pool = element_pool do
  pool_type :indicator
end

capability_pool = element_pool do
  pool_type :capability  
end

intention_pool = element_pool do
  pool_type :intention
end

3.times do
  tag_pool        << tag        { name "Example" }
  signature_pool  << signature  { name "Example" }
  indicator_pool  << indicator  { name "Example" }
  capability_pool << capability { name "Example" }
  intention_pool  << intention  { name "Example" }
end

example_type = type { name "Example" }

example_threat = threat do
  name "Example threat"
  tags tag_pool
  type example_type 
  smry "Examples for days."
  desc "Needed an example, so this threat is it."
  signatures   signature_pool
  indicators   indicator_pool
  intentions   intention_pool
  capabilities capability_pool
end

puts example_threat.to_json pretty: true
