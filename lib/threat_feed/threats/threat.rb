module ThreatFeed

  class Threat

    def initialize(&block)
      setup
      build(&block) if block_given?
    end

    def build(&block)
      raise "Block not given!" unless block_given?
      self.instance_eval(&block)
      self
    end

    def name?
      @name ? true : false
    end

    # The +name+ of the Threat.
    def name(n = false)
      return @name if n == false
      @name = n
    end

    def name=(n)
      @name = n
    end

    def type?
      @type ? true : false
    end

    # The +type+ of Threat.
    def type(t = false)
      return @type if t == false
      raise "Not a type" unless t.is_a? Type
      @type = t
    end

    def type=(t)
      raise "Not a type" unless t.is_a? Type
      @type = t
    end

    def id?
      @id ? true : false
    end

    # The uniq +id+ of Threat.
    def id(i = false)
      return @id if i == false
      @id = i
    end

    def id=(i)
      @id = i
    end

    def summary?
      @summary ? true : false
    end

    # The short +summary+ of the Threat.
    def summary(s = false)
      return @summary if s == false
      @summary = s
    end

    def summary=(s)
      @summary = s
    end

    alias smry summary
    alias smry= summary=

    # The possibly longer +description+ of the Threat.
    def description(d = false)
      return @description if d == false
      @description = d 
    end

    def description?
      @description ? true : false
    end

    def description=(d)
      @description = d 
    end

    alias desc description
    alias desc= description=

    def indicators?
      @indicators ? true : false
    end

    def indicator(i)
      @indicators << i
    end

    def indicators=(i)
      @indicators << i
    end

    # The possible +indicators+ of the Threat.
    def indicators(i = [])
      return @indicators if i.empty?
      i.each do |indic|
        @indicators << indic
      end
    end

    def tags?
      @tags ? true : false
    end

    # The +tags+ associated with the Threat.
    def tag(t)
      @tags << t
    end

    def tags(t = false)
      return @tags if t == false
      @tags = t if t.is_a? Tags
      if t.is_a? Array or t.is_a? Set
        t.each { |tag| @tags << tag }
      end
      false
    end

    def tags=(t)
      @tags = t
    end
    
    def rank?
      @rank ? true : false
    end

    # The +rank+ associated with the Threat.
    def rank(r = false)
      return @rank if r == false
      @rank = r
    end

    def rank=(r)
      @rank = r
    end

    # The +impact+ associated with the Threat.
    def impact(i = false)
      return @impact if i == false
      @impact = i
    end

    def impact=(i)
      @impact = i
    end
    
    def impact?
      @impact ? true : false
    end

    # The uniq +signatures+ associated with the Threat.
    def signature(i)
      raise "Not a signature!" unless i.is_a? Signature
      @signatures << i
    end

    # TODO re-implement smarter
    #def signatures=(i)
    #  raise "Not a signature!" unless i.is_a? Signature
    #  @signatures << i
    #end
    def signatures?
      @signatures ? true : false
    end

    def signatures(i = [])
      return @signatures if i.empty?
      i.each do |indic|
        @signatures << indic
      end
    end

    def capability(c)
      @capabilities << c
    end

    alias capa capability

    def capabilities=(c)
      @capabilities = c
    end
    
    def capabilities?
      @capabilities ? true : false
    end

    # The +capabilities+ associated with the Threat.
    def capabilities(c = [])
      return @capabilities if c.empty?
      c.each do |cap|
        @capabilities << cap
      end
    end

    alias capas capabilities
    
    def intentions?
      @intentions ? true : false
    end

    def intention(i)
      @intentions << i
    end

    alias intent intention

    def intentions=(i)
      @intentions = i
    end

    # The +intentions+ associated with the Threat.
    def intentions(i = [])
      return @intentions if i.empty?
      i.each do |int|
        @intentions << int
      end
    end

    alias intents intentions

    # Turn a threat into a +key => value+ form.
    def to_h
      { threat: { name: @name, 
                  id: @id,
                  type: @type.to_h[:type], 
                  tags: @tags.to_h,
                  summary: @summary, 
                  description: @description, 
                  impact: @impact, 
                  rank: @rank, 
                  intentions: @intentions.to_a, 
                  capabilities: @capabilities.to_a, 
                  indicators: @indicators.to_a, 
                  signatures: @signatures.to_h } }
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

    # Turn a threat into +json+.
    def to_json(pretty: false)
      return JSON.pretty_generate(to_h) if pretty
      to_h.to_json
    end

    private

    # Do a little prep work before we start cooking.
    def setup
      @name         = nil
      @type         = nil
      @id           = nil
      @rank         = nil
      @impact       = nil
      @description  = nil
      @summary      = nil
      @tags         = Tags.new 
      @indicators   = Set.new
      @signatures   = Signatures.new
      @intentions   = Set.new
      @capabilities = Set.new
    end

  end

end
