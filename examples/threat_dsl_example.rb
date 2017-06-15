$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'
require 'pry'

include ThreatFeed

tag_pool = element_pool.new do
  name "Tag Pool"
  smry "Simple tag pool."
  desc "Needed an example for tag pooling."
  element_type Tag
end

signature_pool = element_pool.new do
  name "Signature Pool"
  smry "Simple signature pool."
  desc "Needed an example for signature pooling."
  element_type Signature
end

indicator_pool = element_pool.new do
  name "Indicator Pool"
  smry "Simple indicator pool."
  desc "Needed an example for indicator pooling."
  element_type Indicator 
end

capability_pool = element_pool.new do
  name "Capability Pool"
  smry "Simple capabilities pool."
  desc "Needed an example for capability pooling."
  element_type Capability 
end

intention_pool = element_pool.new do
  name "Intention Pool"
  smry "Simple intentions pool."
  desc "Needed an example for intention pooling."
  element_type Intention 
end

3.times do
  tag_pool        << tag        { name "Example" }
  signature_pool  << signature  { name "Example" }
  indicator_pool  << indicator  { name "Example" }
  capability_pool << capability { name "Example" }
  intention_pool  << intention  { name "Example" }
end

example_threat = threat do
  name "Example threat"
  smry "Examples for days."
  desc "Needed an example, so this threat is it."
  tags tag_pool 
  signatures signature_pool
  indicators indicator_pool
  capabilities capability_pool
  intentions intention_pool
end

puts example_threat.to_json pretty: true
