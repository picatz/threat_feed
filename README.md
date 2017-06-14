# Threat Feed

Threat Feed is an open source threat intelligence framework. Still a work in progress.

#### Some Thoughts and Plans

"Threat Intelligence as code."

Maybe some `rspec` custom matchers/helpers once I hammer out some more details. 

I'm mostly just having fun with this project while implementing a DSL.

## DSL

Threat Feed includes a simple, optional DSL to create different elements for the framework.

#### Threat
```ruby
ThreatFeed.threat do
  name "Example threat"
  desc "This is an example threat description."
end
```

#### Type
```ruby
ThreatFeed.type do
  name "Example type"
  desc "This is an example threat type."
end
```

#### Tag
```ruby
ThreatFeed.tag do
  name "Example tag"
  desc "This is an example threat tag."
end
```

#### Signature
```ruby
ThreatFeed.signature do
  name "Example signature"
  desc "This is an example threat signature."
end
```

## Usage

You can use the Threat Feed `Threat` DSL ( domain specific language ) to describe a threat.

```ruby
threat = ThreatFeed.threat do
  id 1
  name "Threat Example"
  type example_type
  tags [tag1, tag2]
  rank 0
  impact 0
  signature   example_signature
  indicator   "This is an example threat indicator."
  description "This is an example threat description."
  intention   "This is an example threat intention."
  capability  "This is an example threat capability."
end
```

#### To JSON

```ruby
threat.to_json(pretty: true)
```

Which will yield a JSON representation of the threat:

```json
# add json output of threat here
```

#### From JSON

To turn the JSON representation of the threat back into a `Threat` object.

```ruby
threat_json = threat.to_json

threat_copy = ThreatFeed.threat do
	from_json string: threat_json
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
