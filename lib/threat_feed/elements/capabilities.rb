module ThreatFeed

  module Elements

    module Capabilities 

      @capabilities = Set.new

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
      def capabilities(c = [])
        return @capabilities if c.empty?
        c.each do |cap|
          @capabilities << cap
        end
      end

      alias capas capabilities

    end

  end

end

