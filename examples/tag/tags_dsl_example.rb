$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'threat_feed'
require 'pry'

example_type = ThreatFeed.type do
  id 1
  name "Example type"
  desc "Example type description."
  smry "Example summary."
end

# Lets create a few threat individual threat tags
tag1 = ThreatFeed.tag do
  id 1
  type example_type
  name "Threat Example"
  desc "This is a threat."
  smry "Needed example."
end

tag2 = ThreatFeed.tag do
  id 2
  type example_type
  name "Threat Example"
  desc "This is also threat."
  smry "Needed example."
end

tag3 = ThreatFeed.tag do
  id 3
  type example_type
  name "Threat Example"
  desc "Did you guess this is a threat?"
  smry "Needed example."
end

# Let's pool all of those together
tags = ThreatFeed.tags do
  add tag1
  add tag2
  add tag3
end

# Output as JSON
puts tags.to_json(pretty: true)
