module ThreatFeed

  class Tags 

    def initialize(&block)
      setup
      build(&block) if block_given?
    end
    
    def build(&block)
      raise "Block not given!" unless block_given?
      self.instance_eval(&block)
      self
    end

    def exists?(tag)
      @pool.include?(tag)
    end

    def pool
      @pool
    end

    alias all pool

    def add(tag)
      self << tag
    end
    
    def delete(tag)
      @pool.delete(tag)
    end

    def each
      return @pool unless block_given?
      @pool.each do |tag|
        yield tag
      end
    end

    def <<(tag)
      @pool << tag if tag.is_a? Tag
    end

    def to_h
      @pool.map(&:to_h)
    end

    def to_json(pretty: false)
      return JSON.pretty_generate({ tags: @pool.to_a.map { |t| t.to_h }}) if pretty
      to_h.to_json
    end

    def from_hash(array_of_hashes)
      array_of_hashes.each do |hash|
        self << ThreatFeed.tag do
          from_hash hash
        end 
      end
      self
    end

    alias from_h from_hash

    private

    def setup
      @pool = Set.new
    end

  end

end
