module ThreatFeed

  class Signatures 

    def initialize(&block)
      setup
      build(&block) if block_given?
    end

    def build(&block)
      raise "Block not given!" unless block_given?
      self.instance_eval(&block)
      self
    end

    def exists?(sig)
      @pool.include?(sig)
    end

    def pool
      @pool
    end

    alias all pool

    def add(sig)
      self << sig
    end

    def delete(sig)
      @pool.delete(sig)
    end

    def each
      return @pool unless block_given?
      @pool.each do |sig|
        yield sig
      end
    end

    def <<(sig)
      return false unless sig.is_a? Signature
      @pool << sig 
    end

    def to_h
      @pool.map(&:to_h)
    end

    def to_json(pretty: false)
      return JSON.pretty_generate({ signatures: to_h }) if pretty
      to_h.to_json
    end

    def from_hash(array_of_hashes)
      array_of_hashes.each do |hash|
        self << ThreatFeed.signature do
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
