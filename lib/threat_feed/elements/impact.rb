module ThreatFeed

  module Elements

    module Impact 

      @impact = nil

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

    end

  end

end

