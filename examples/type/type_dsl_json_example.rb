$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'threat_feed'

# Example of creating a threat using the DSL
type = ThreatFeed.type do
  id 1
  name "Type Example"
  desc "This is an example type description."
  smry "Example summary."
end

# Output as JSON
old_json = type.to_json(pretty: true)

type2 = ThreatFeed.type do
  from_json string: old_json
end

puts type2.to_json(pretty: true)
