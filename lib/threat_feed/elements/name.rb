module ThreatFeed

  module Elements

    module Name

      @name = nil

      def name?
        @name ? true : false
      end

      def name(n = false)
        return @name if n == false
        @name = n
      end

      def name=(n)
        @name = n
      end

    end

  end

end

