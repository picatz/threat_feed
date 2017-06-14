require "spec_helper"

RSpec.describe ThreatFeed::Type do

  context 'when creating a new type' do

    describe '.new' do

      before { @type = nil }

      it 'can create a new tag' do
        expect { @type = ThreatFeed.type.new }.to_not raise_error
        expect(@type).to be_a(ThreatFeed::Type)
      end

      it 'has an optional dsl' do
        @type = ThreatFeed.tag.new { name "Example" }
        expect(@type.name).to eq("Example")
      end

    end

  end

  # TODO add more
end
