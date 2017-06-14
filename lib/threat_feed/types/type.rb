module ThreatFeed

  class Type 

    def initialize(&block)
      setup
      build(&block) if block_given?
    end

    def build(&block)
      raise "Block not given!" unless block_given?
      self.instance_eval(&block)
      self
    end

    def name(n = false)
      return @name if n == false
      @name = n
    end

    def name=(n)
      @name = n
    end

    def id(i = false)
      return @id if i == false
      @id = i
    end

    def id=(i)
      @id = i
    end

    def summary(s = false)
      return @summary if s == false
      @summary = s 
    end

    def summary=(s)
      @summary = s 
    end

    alias smry summary
    alias smry= summary=

      def description(d = false)
        return @description if d == false
        @description = d 
      end

    def description=(d)
      @description = d 
    end

    alias desc description
    alias desc= description=
    
    def from_hash(h)
      h            = h["type"]        if h["type"]
      @name        = h["name"]        if h["name"]
      @id          = h["id"]          if h["id"]
      @summary     = h["summary"]     if h["summary"]
      @description = h["description"] if h["description"]
      self
    end

    alias from_h from_hash

    def to_h
      { type: { name: @name,
          id: @id, 
          summary: @summary,
          description: @description } }
    end

    def to_json(pretty: false)
      return JSON.pretty_generate(to_h) if pretty
      to_h.to_json
    end

    def from_json(file: nil, string: nil)
      if file
        h = JSON.parse(File.read(file))
      elsif string
        h = JSON.parse(string)
      end
      from_hash(h)
    end


    private

    def setup
      @name        = nil
      @id          = nil
      @summary     = nil
      @description = nil
    end

  end

end
