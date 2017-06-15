module ThreatFeed

  module Elements

    module Signatures 

      @signatures = ThreatFeed::Signatures.new 

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

      def signatures(i = nil)
        return @signatures if i.nil?
        if i.is_a? ElementPool
          raise "Not an element pool of signatures" unless i.element_type == Signature 
          i = i.pool
        end
        i.each do |sig|
          @signatures << sig
        end
      end

    end

  end

end

