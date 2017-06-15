module ThreatFeed

  class Element 

    def initialize(&block)
      setup
      build(&block) if block_given?
    end

    def build(&block)
      raise "Block not given!" unless block_given?
      self.instance_eval(&block)
      self
    end

    def from_hash(h)
      raise "Not implemented yet!"
    end

    alias from_h from_hash

    def to_h
      raise "Not implemented yet!"
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

    def setup
      false
      # add boilerplate code in this method
    end

  end
end
