$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'threat_feed'

# Example of creating a threat using the DSL
tag = ThreatFeed.tag do
  id 1
  type "Example"
  name "Threat Example"
  desc "This is an example tag description."
  smry "Example summary."
end

# Output as JSON
puts tag.to_json(pretty: true)
