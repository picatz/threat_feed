require "spec_helper"

RSpec.describe ThreatFeed::Threat do

  context 'when creating a new threat' do

    describe '.new' do

      before { @threat = nil }

      it 'can create a new threat type' do
        expect { @threat = ThreatFeed.threat.new }.to_not raise_error
        expect(@threat).to be_a(ThreatFeed::Threat)
      end

      it 'has an optional dsl' do
        @threat = ThreatFeed.threat.new { name "Example" }
        expect(@threat.name).to eq("Example")
      end

    end

  end

end
