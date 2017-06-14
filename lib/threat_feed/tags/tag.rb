module ThreatFeed

  class Tag 

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

    def type(t = false)
      return @type if t == false
      raise "Not a type" unless t.is_a? Type
      @type = t
    end

    def type=(t)
      raise "Not a type" unless t.is_a? Type
      @type = t
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

    def from_json(file: nil, string: nil)
      if file
        h = JSON.parse(File.read(file))
      elsif string
        h = JSON.parse(string)
      end
      from_hash(h)
    end
    
    def from_hash(h)
      h            = h["tag"]               if h["tag"]
      @name        = h["name"]              if h["name"]
      @id          = h["id"]                if h["id"]
      @type        = type.from_h(h["type"]) if h["type"]
      @summary     = h["summary"]           if h["summary"]
      @description = h["description"]       if h["summary"]
      self
    end

    alias from_h from_hash

    def to_h
      { tag: { name: @name, 
               id: @id, 
               type: @type.to_h[:type], 
               summary: @summary, 
               description: @description } }
    end

    def to_json(pretty: false)
      return JSON.pretty_generate(to_h) if pretty
      to_h.to_json
    end

    private

    def setup
      @name        = nil
      @type        = nil
      @id          = nil
      @summary     = nil
      @description = nil
    end

  end

end
