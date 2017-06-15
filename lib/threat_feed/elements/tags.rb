module ThreatFeed

  module Elements

    module Tags

      def tags?
        @tags ? true : false
      end

      def tag(t)
        binding.pry
        @tags << t
      end

      def tags(t = nil)
        return @tags if t == nil
        t = t.pool 
        if t.is_a? ElementPool
          raise "Not an element pool of tags" unless t.element_type == Tag
          t = t.pool
        end
        t.each do |tag| 
          @tags << tag
        end
      end

      def tags=(t)
        @tags = t
      end

    end

  end

end

