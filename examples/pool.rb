$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'threat_feed'
require 'pry'

include ThreatFeed

# Create an element pool for tags
tag_pool = element_pool.new

# Build up the element pool
tag_pool.build do 
  name "Tag Pool"
  smry "Simple tag pool."
  desc "Needed an example for element pools."
  element_type Tag
end

# Add three tags
3.times do
  t = tag do
    name "Example"
  end
  tag_pool << t
end

example_threat = threat.new

example_threat.build do
  name "Example threat"
  desc "Needed anouther example. So. Yeah."
  #tags tag_pool
end

binding.pry
