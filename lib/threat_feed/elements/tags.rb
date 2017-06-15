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

      def tags(t = false)
        return @tags if t == false
        @tags = t if t.is_a? Tags
        if t.is_a? Array or t.is_a? Set
          t.each { |tag| @tags << tag }
        end
        false
      end

      def tags=(t)
        @tags = t
      end

    end

  end

end

