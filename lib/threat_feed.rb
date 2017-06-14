require "set"
require "json"
require "securerandom"
require "threat_feed/version"
require "threat_feed/threats/threat"
#require "threat_feed/threats"
require "threat_feed/types/type"
#require "threat_feed/types"
require "threat_feed/tags/tag"
require "threat_feed/tags/tags"
require "threat_feed/signatures/signature"
require "threat_feed/signatures/signatures"

module ThreatFeed

  # A single threat.
  def self.threat(&block)
    return Threat unless block_given?
    threat = Threat.new(&block)
  end

  # A pool of threats.
  def self.threats
    Threats
  end

  # A single type.
  def self.type(&block)
    return Type unless block_given?
    type = Type.new(&block)
  end
  
  # A single signature.
  def self.signature(&block)
    return Signature unless block_given?
    sig = Signature.new(&block)
  end

  #def self.types
  #  Types
  #end
 
  # A single tag. 
  def self.tag(&block)
    return Tag unless block_given?
    tag = Tag.new(&block)
  end

  # A pool of tags.
  def self.tags(&block)
    return Tags unless block_given?
    tags = Tags.new(&block)
  end

end
