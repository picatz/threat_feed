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
      @type = t
    end

    def type=(t)
      @type = t
    end

    def id(i = false)
      return @id if i == false
      @id = i
    end

    def id=(i)
      @id = i
    end

    def description(d = false)
      return @description if d == false
      @description = d 
    end

    def description=(d)
      @description = d 
    end

    alias desc description
    alias desc= description=

    def to_h
      { tag: { name: @name, 
               id: @id, 
               description: @description, 
               impact: @impact } }
    end

    def to_json
      to_h.to_json
    end

    private

    def setup
      @name = nil
      @type = nil
      @id   = nil
    end

  end

end
