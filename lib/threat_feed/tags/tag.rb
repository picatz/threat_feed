module ThreatFeed

  class Tag < Element 

    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Type
    include ThreatFeed::Elements::Description
   
    def from_hash(h)
      h            = h["tag"]               if h["tag"]
      @name        = h["name"]              if h["name"]
      @id          = h["id"]                if h["id"]
      @type        = type.from_h(h["type"]) if h["type"]
      @summary     = h["summary"]           if h["summary"]
      @description = h["description"]       if h["summary"]
      self
    end

    def to_h
      { tag: { name: @name, 
               id: @id, 
               type: @type.to_h[:type], 
               summary: @summary, 
               description: @description } }
    end

  end

end
