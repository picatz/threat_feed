$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'
require 'pry'

include ThreatFeed

example_tags = []
3.times do
  example_tags << tag { name "Example" }
end

example_signature = signature do
  name "Example signature"
end

example_signature2 = signature do
  name "Example signature"
end

example_threat = threat do
  name "Example threat"
  smry "Examples for days."
  desc "Needed an example, so this threat is it."
  tags example_tags
  signature example_signature
end

puts example_threat.to_json pretty: true
