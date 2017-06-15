module ThreatFeed

  module Elements

    module Rank 
      
      @rank = nil

      # The +rank+ associated with the Threat.
      def rank(r = false)
        return @rank if r == false
        @rank = r
      end

      def rank=(r)
        @rank = r
      end

    end

  end

end

