require "set"
require "json"
require "securerandom"
require "threat_feed/version"
require "threat_feed/elements/capabilities"
require "threat_feed/elements/description"
require "threat_feed/elements/elements"
require "threat_feed/elements/id"
require "threat_feed/elements/impact"
require "threat_feed/elements/indicators"
require "threat_feed/elements/intentions"
require "threat_feed/elements/name"
require "threat_feed/elements/rank"
require "threat_feed/elements/type"
require "threat_feed/elements/summary"
require "threat_feed/elements/element"
require "threat_feed/elements/element_pool"
require "threat_feed/tags/tag"
require "threat_feed/elements/tags"
require "threat_feed/signatures/signature"
require "threat_feed/indicators/indicator"
require "threat_feed/signatures/signatures"
require "threat_feed/elements/signatures"
require "threat_feed/types/type"
require "threat_feed/tags/tags"
require "threat_feed/threats/threat"



module ThreatFeed



  # A single threat.
  def self.threat(&block)
    return Threat unless block_given?
    threat = Threat.new(&block)
  end
  
  def threat(&block)
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
  
  def type(&block)
    return Type unless block_given?
    type = Type.new(&block)
  end

  # A single signature.
  def self.signature(&block)
    return Signature unless block_given?
    sig = Signature.new(&block)
  end
  
  def signature(&block)
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

  def tag(&block)
    return Tag unless block_given?
    tag = Tag.new(&block)
  end
  
  # A pool of tags.
  def self.tags(&block)
    return Tags unless block_given?
    tags = Tags.new(&block)
  end
  
  def tags(&block)
    return Tags unless block_given?
    tags = Tags.new(&block)
  end

  def self.elements
    Elements
  end
  
  def elements
    Elements
  end
  
  def self.element_pool(&block)
    return ElementPool unless block_given?
    pool = ElementPool.new(&block)
  end
  
  def element_pool(&block)
    return ElementPool unless block_given?
    pool = ElementPool.new(&block)
  end

end

