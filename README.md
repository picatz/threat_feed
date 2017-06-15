# Threat Feed

Threat Feed is an open source threat intelligence framework. Still a work in progress.

##### Design Goals

I want to be able to describe a threat as code. `Threat intelligence as code`. I want this to be easy, shareable and testable without knowing a whole bunch about code, distribution, or testing frameworks. 

## JSON

To keep things simple, a `Threat` can be thought of a specifc set of JSON "elements".

### Why JSON?

JSON is pretty much everywhere. Pretty easy to work with in multiple languages. Easy to dump into databases and search engines like elasticsearch.

## DSL

Threat Feed includes a simple, optional DSL to create different elements for the framework.

### Why a DSL?

A `Domain Specific Language` is a great way to express ideas as code in a specific way to address a problem domain. In Threat Feed's case: a DSL to describe elements associated with threat intelligence.

#### Very Basic Example

```ruby
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
```
#### To JSON

```ruby
example_threat.to_json(pretty: true)
```

Which will yield a JSON representation of the threat:

```json
# add json output of threat here
```

#### From JSON

To turn the JSON representation of the threat back into a `Threat` object.

```ruby
threat_json = example_threat.to_json

threat_copy = ThreatFeed.threat do
	from_json string: threat_json
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
