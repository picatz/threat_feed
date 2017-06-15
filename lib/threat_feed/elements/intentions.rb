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
      def intentions(i = nil)
        return @intentions if i.nil?
        if i.is_a? ElementPool
          raise "Not an element pool of intentions" unless i.element_type == Intention 
          i = i.pool
        end
        i.each do |intt|
          @intentions << intt
        end
      end

      alias intents intentions

    end
  end
end

