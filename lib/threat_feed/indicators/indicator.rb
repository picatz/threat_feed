module ThreatFeed

  class Indicator < Element 
    
    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::Type
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Description
    
    def from_hash(h)
      h            = h["indicator"]   if h["indicator"]
      @name        = h["name"]        if h["name"]
      @id          = h["id"]          if h["id"]
      @type        = h["type"]        if h["type"]
      @summary     = h["summary"]     if h["summary"]
      @description = h["description"] if h["description"]
      self
    end

    def to_h
      { indicator: { name: @name,
          id: @id, 
          type: @type, 
          summary: @summary,
          description: @description } }
    end

  end

end
