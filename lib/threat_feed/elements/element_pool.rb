module ThreatFeed

  class ElementPool < Element 

    @pool = Set.new

    include ThreatFeed::Elements::Name
    include ThreatFeed::Elements::Type
    include ThreatFeed::Elements::ID
    include ThreatFeed::Elements::Summary
    include ThreatFeed::Elements::Description

    def exists?(element)
      @pool.include?(element)
    end

    def pool
      @pool || @pool = Set.new
    end

    alias all pool

    def add(element)
      self << element
    end

    def delete(element)
      @pool.delete(element)
    end

    def each
      return @pool unless block_given?
      @pool.each do |element|
        yield element
      end
    end

    def <<(element)
      unless @freeeeeeeee_as_a_bird
        raise "Element pool type 'element_type' has not been set or free'd up." if @element_type.nil?
        return false unless element.is_a? @element_type
      end
      pool << element
    end

    def element_type(type = nil, override: false)
      unless override
        raise "I'm a free bird!" if @freeeeeeeee_as_a_bird 
      end
      return @element_type = type unless type.nil?
      @element_type
    end
    
    def to_h
      return {} if @pool.nil?
      @pool.map(&:to_h)
    end

    def free_me_baby
      @freeeeeeeee_as_a_bird = true
    end

    alias free free_me_baby

    def free?
      @freeeeeeeee_as_a_bird ? true : false
    end 

  end

end
