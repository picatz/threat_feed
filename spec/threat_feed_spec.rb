require "spec_helper"

RSpec.describe ThreatFeed do

  it "has a version number" do
    expect(ThreatFeed::VERSION).not_to be nil
  end

end
