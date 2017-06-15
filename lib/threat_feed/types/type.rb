module ThreatFeed

  class Type < Element 

    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Description
    
    def from_hash(h)
      h            = h["type"]        if h["type"]
      @name        = h["name"]        if h["name"]
      @id          = h["id"]          if h["id"]
      @summary     = h["summary"]     if h["summary"]
      @description = h["description"] if h["description"]
      self
    end

    def to_h
      { type: { name: @name,
          id: @id, 
          summary: @summary,
          description: @description } }
    end

  end

end
