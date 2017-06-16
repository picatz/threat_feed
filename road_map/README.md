# Threat Feed Road Map

Threat Feed, as a project, has one over-arching goal: `Threat Intelligence as Code`.

### What does "Threat Intelligence as Code" even mean?

Well, in some ways, that's what I am trying to work out right now. 

## The current state of Threat Intelligence

Threat Intelligence is a is an "organized, analyzed and refined information about potential or current attacks that threaten an organization."[*](http://whatis.techtarget.com/definition/threat-intelligence-cyber-threat-intelligence). I would argue that, in many ways, threat intelligence is a very loosely organized, hard to analyze, and less refined than I think people want it to be.

### Organization

I think have an open source, organized framework that is easy to use and highly accessible to both noobs and professionals alike. This way information can be collected in a meaningful manner. So, what format could help organize the infromation surrounding "Threat Intelligence"?

I think defining a `JSON` representation of the elements that need to exists in what defines as `Threat` could be a very useful way to put that information in a meaninful form that isn't something like a Word document or some PDF people don't read. In many ways, `Threat Intellience as Code` is a lot like `Organizing Threat Intelligence through lightweight data-interchange formats` or something like that. But, I guess that doesn't really have the same ring to it, huh?

### Analyzation

Once threat intelligence is formatted in a simple, meaningful way: it's very easy to store that information in a datastore like MongoDB, Elastic Search, or whatever else. You can even parse the JSON and throw that into a SQL database if you really wanted to.

### Refinement

If a stream of open source threat intelligence feeds were established using an opensource standard, that could be really neat. The actual contents of those threat feeds could be put into version control, collected, open sourced, expanded upon by an open source community. Without getting really excited about the possibilities of that: I just think that there could be some neat applications of a framework if it existed. So, I figured I'd put some time into making that.




# Defining a Threat

While the overall goal for defining a threat I think should be pretty easy, it's also important to effective and efficient at actually solving the problem I am trying to work on. I want it to be flexible enough to be adopted or adapted from older threat intelligence feeds; and I want there to be a sense of "obviousness" to why a thing is a way that it is.

Because I'm sort of describing this framework for how a threat can be modeled; this will be the interface to what everything else will ultimately feed into.

## A Threat as JSON

First, here's a rought draft of sorts of what I am thinking:

```json
{
	"threat": {
		"name": "Example",
			"summary": "Examples for days.",
			"description": "Needed an example, so this threat is it. It's very simple.",
			"id": null,
			"type": {
				"name": "Example",
				"id": null,
				"summary": null,
				"description": null
			},
			"tags": [
			{
				"tag": {
					"name": "Example",
					"id": null,
					"type": null,
					"summary": null,
					"description": null
				}
			}
			],
			"intentions": [
			{
				"intention": {
					"name": "Example",
					"id": null,
					"type": null,
					"summary": null,
					"description": null
				}
			}
			],
			"capabilities": [
			{
				"capability": {
					"name": "Example",
					"id": null,
					"type": null,
					"summary": null,
					"description": null
				}
			}
			],
			"indicators": [
			{
				"indicator": {
					"name": "Example",
					"id": null,
					"type": null,
					"summary": null,
					"description": null
				}
			}
			],
			"signatures": [
			{
				"signature": {
					"name": "Example",
					"id": null,
					"type": null,
					"summary": null,
					"description": null
				}
			}
			]
	}
}
```
## Threat Header

The top of the JSON contains what, for now, I'll call the "Threat Header" -- this is basically the barebones of what makes up a threat.

```json
{
	"threat": {
		"name": "Example",
		"summary": "Examples for days.",
		"description": "Needed an example, so this threat is it. It's very simple.",
		"id": null,
		"type": {
			"name": "Example",
			"id": null,
			"summary": null,
			"description": null
		}
	}
}
```

The `name` of the threat should hopefulyl be uniq, but that's why we have an `id` for the threat which must be uniq to whatever threat feed system it is apart of. The `summary` is a very short summarization of what the threat is; and the `description` should help elaborate on that further. A further detaild report could be included with a `README.md` for the threat in a version control system which could be useful for providing extra context. Though that extra context should be baked into the Threat itself. This brings us the final part of the header which is the `type` of threat that it is.

### Type

The `type` is an element that is used throughout threat feed elements to help associate elements with eachother. Threats have types, tags have types, and everything else has a `type` associated with it. A type has a `name`, a uniq `id`, `summary` and a `description`.

```json
{
	"type": {
		"name": "Example",
		"id": null,
		"summary": null,
		"description": null
	}
}
```

### Tags

My favorite feature about a `Threat` is the tagging system. Tags have a `type`, `name`, uniq `id`, `summary` and, can you guess? Yes. A `description` too! A threat can have more than one `tag` in its tag pool. Tags should not repeat.

```json
{
	"tags": [
	{
		"tag": {
			"name": "Example",
			"id": null,
			"type": null,
			"summary": null,
			"description": null
		}
	}
	]
}

```

#### Tags for Time

If we wanted to create a tag that helped pin the time a threat was created in our threat feed, we could do something like this:

```json
{
	"tag": {
		"name": "Time Created",
		"id": "3caa89b9-dbab-4929-8d67-b779ae1ab892",
		"type": "Creation",
		"summary": "The time the threat was created.",
		"description": null
	}
}
```
The `name` of the tag is "Time Created" to describe that this is simply a Time the Threat was created. The `type` follows suit as a "Creation" type which could be defined to describe when something is created. A summary of the tag could be "The time the threat was created." since that is what it is -- and, since that is pretty straightforward, we will intentionally leave the description empty.

##### Example Group of Time Tags

Depending on the threat, maybe you would want to add those as tags to the threat.

```json
{
	"tags": [
		"tag": {
			"name": "Time Created",
				"id": "3caa89b9-dbab-4929-8d67-b779ae1ab892",
				"type": "Creation",
				"summary": "The time the threat was created.",
				"description": null
		},
		"tag": {
			"name": "Last Seen",
			"id": "62d8976d-77c9-4489-962b-4908b45cfe73",
			"type": "Sighting",
			"summary": "The time the threat was last seen.",
			"description": null
		}
	]
}
```

The tag `Last Seen` could be updated based on live events in some fashion.


## More TODO




