module ThreatFeed

  module Elements

    module Indicators 

      def indicators?
        @indicators ? true : false
      end

      def indicator(i)
        @indicators << i
      end

      def indicators=(i)
        @indicators << i
      end

      def indicators(i = [])
        return @indicators if i.empty?
        i.each do |indic|
          @indicators << indic
        end
      end

    end

  end

end

