module ThreatFeed

  class Threats < ElementPool 
    name "Threat Pool"
    desc "A simple collection of Threats built on Element Pool."
    smry "A pool of threats."
    element_type ThreatFeed::Threat
  end

end
