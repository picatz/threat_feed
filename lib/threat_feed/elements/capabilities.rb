module ThreatFeed

  module Elements

    module Capabilities 

      def capability(c)
        @capabilities << c
      end

      alias capa capability

      def capabilities=(c)
        @capabilities = c
      end

      def capabilities?
        @capabilities ? true : false
      end

      # The +capabilities+ associated with the Threat.
      def capabilities(i = nil)
        return @capabilities if i.nil?
        if i.is_a? ElementPool
          raise "Not an element pool of capabilities" unless i.element_type == Capability 
          i = i.pool
        end
        i.each do |capa|
          @capabilities << capa
        end
      end

      alias capas capabilities

    end

  end

end

