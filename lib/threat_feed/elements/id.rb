module ThreatFeed

  module Elements

    module ID 

      @id = nil

      def id?
        @id ? true : false
      end

      # The uniq +id+ of Threat.
      def id(i = false)
        return @id if i == false
        @id = i
      end

      def id=(i)
        @id = i
      end

    end

  end

end

