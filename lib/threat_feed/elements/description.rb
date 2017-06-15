module ThreatFeed

  module Elements

    module Description 

      @description = nil

      def description(d = false)
        return @description if d == false
        @description = d 
      end

      def description?
        @description ? true : false
      end

      def description=(d)
        @description = d 
      end

      alias desc description
      
      alias desc= description=

    end

  end

end

