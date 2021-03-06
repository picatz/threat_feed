module ThreatFeed

  class Signature < Element 
    
    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::Type
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Description
    
    def from_hash(h)
      h            = h["signature"]   if h["signature"]
      @name        = h["name"]        if h["name"]
      @id          = h["id"]          if h["id"]
      @summary     = h["summary"]     if h["summary"]
      @description = h["description"] if h["description"]
      self
    end

    def to_h
      { signature: { name: @name,
          id: @id, 
          summary: @summary,
          description: @description } }
    end

  end

end
