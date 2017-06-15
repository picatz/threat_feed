require "spec_helper"

RSpec.describe ThreatFeed::Threat do

  context 'when creating a new threat' do

    describe '.new' do

      before { @threat = nil }

      it 'can create a new threat' do
        expect { @threat = ThreatFeed.threat.new }.to_not raise_error
        expect(@threat).to be_a(ThreatFeed::Threat)
      end

      it 'has an optional dsl' do
        @threat = ThreatFeed.threat { name "Example" }
        expect(@threat.name).to eq("Example")
      end

      it 'can be initialized without any options' do
        @threat = ThreatFeed.threat.new
        expect(@threat.name).to eq(nil)
      end
    end

  end

  


end
