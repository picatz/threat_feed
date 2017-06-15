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

      def signatures(i = [])
        return @signatures if i.empty?
        i.each do |indic|
          @signatures << indic
        end
      end

    end

  end

end

