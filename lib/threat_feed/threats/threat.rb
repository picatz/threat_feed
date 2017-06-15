module ThreatFeed

  class Threat < Element

    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::Type
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Description
    include ThreatFeed::Elements::Indicators
    include ThreatFeed::Elements::Tags
    include ThreatFeed::Elements::Rank
    include ThreatFeed::Elements::Impact
    include ThreatFeed::Elements::Signatures
    include ThreatFeed::Elements::Capabilities
    include ThreatFeed::Elements::Intentions

    def setup
      @tags = ThreatFeed::ElementPool.new do
        name "Tag Pool"
        desc "A simple pool of tags."
        element_type Tag
      end
      @signatures = ThreatFeed::ElementPool.new do
        name "Signature Pool"
        desc "A simple pool of signatures."
        element_type Signature
      end
      @indicators = ThreatFeed::ElementPool.new do
        name "Indicator Pool"
        desc "A simple pool of indicators."
        element_type Indicator
      end
      @capabilities = ThreatFeed::ElementPool.new do
        name "Capability Pool"
        desc "A simple pool of capabilities."
        element_type Capability 
      end
      @intentions = ThreatFeed::ElementPool.new do
        name "Intention Pool"
        desc "A simple pool of intentions."
        element_type Intention 
      end
    end

    # Turn a threat into a +key => value+ form.
    def to_h
      { threat: { name:         @name, 
                  id:           @id,
                  type:         @type.to_h[:type], 
                  tags:         @tags.to_h,
                  summary:      @summary, 
                  description:  @description, 
                  impact:       @impact, 
                  rank:         @rank, 
                  intentions:   @intentions.to_h, 
                  capabilities: @capabilities.to_h, 
                  indicators:   @indicators.to_h, 
                  signatures:   @signatures.to_h } }
    end

    def from_json(file: nil, string: nil)
      if file
        h = JSON.parse(File.read(file))
      elsif string
        h = JSON.parse(string)
      end
      h = h["threat"]
      # singles
      @name         = h["name"]         if h["name"]
      @id           = h["id"]           if h["id"]
      @summary      = h["summary"]      if h["summary"]
      @description  = h["description"]  if h["description"]
      @impact       = h["impact"]       if h["impact"]
      @rank         = h["rank"]         if h["rank"]
      # groupings
      @tags         = tags.from_h(h["tags"])   if h["tags"]
      @intentions   = h["intentions"].to_set   if h["intentions"]
      @capabilities = h["capabilities"].to_set if h["capabilities"]
      @indicators   = h["indicators"].to_set   if h["indicators"]
      @signatures   = signatures.from_h(h["signatures"]) if h["signatures"]
      self
    end

  end

end
