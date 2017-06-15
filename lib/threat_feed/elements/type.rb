module ThreatFeed

	module Elements

		module Type

      @type = nil

			def type?
				@type ? true : false
			end

			def type(t = false)
				return @type if t == false
				raise "Not a type" unless t.is_a? ThreatFeed::Type
				@type = t
			end

			def type=(t)
				raise "Not a type" unless t.is_a? ThreatFeed::Type
				@type = t
			end

		end


	end

end
