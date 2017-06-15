module ThreatFeed

  module Elements

    module Intentions 

      @intentions = Set.new

      def intentions?
        @intentions ? true : false
      end

      def intention(i)
        @intentions << i
      end

      alias intent intention

      def intentions=(i)
        @intentions = i
      end

      # The +intentions+ associated with the Threat.
      def intentions(i = [])
        return @intentions if i.empty?
        i.each do |int|
          @intentions << int
        end
      end

      alias intents intentions

    end
  end
end

