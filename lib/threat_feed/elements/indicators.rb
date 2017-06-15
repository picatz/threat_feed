module ThreatFeed

  module Elements

    module Indicators 

      def indicators?
        @indicators ? true : false
      end

      def indicator(i)
        @indicators << i
      end

      # TODO fix later
      #def indicators=(i)
      #  @indicators << i
      #end

      def indicators(i = nil)
        return @indicators if i.nil?
        if i.is_a? ElementPool
          raise "Not an element pool of signatures" unless i.element_type == Indicator 
          i = i.pool
        end
        i.each do |indic|
          @indicators << indic
        end
      end

    end

  end

end

