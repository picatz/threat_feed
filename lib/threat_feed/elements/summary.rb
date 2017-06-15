module ThreatFeed

  module Elements

    module Summary 

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


    end

  end

end

