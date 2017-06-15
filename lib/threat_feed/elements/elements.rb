module ThreatFeed

  module Elements

    def self.build
      # maybe add more DSL like stuff per element
      binding.pry
    end

    def self.element
      Element
    end

    def self.name
      Name
    end

    def self.type
      Type
    end

    def self.id
      ID
    end

    def self.summary
      Summary
    end

    def self.description
      Description
    end

    def self.indicators
      Indicators
    end

    def self.tags
      Tags
    end

    def self.rank
      Rank
    end

    def self.impact
      Impact
    end

    def self.signatures
      Signatures
    end

    def self.capabilities
      Capabilities
    end

    def self.intentions
      Intentions
    end
    
    def self.type
      Type
    end

  end

end
