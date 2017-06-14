require "spec_helper"

RSpec.describe ThreatFeed::Tag do

  context 'when creating a new tag' do

    describe '.new' do

      before { @tag = nil }

      it 'can create a new tag' do
        expect { @tag = ThreatFeed.tag.new }.to_not raise_error
        expect(@tag).to be_a(ThreatFeed::Tag)
      end

      it 'has an optional dsl' do
        @tag = ThreatFeed.tag.new { name "Example" }
        expect(@tag.name).to eq("Example")
      end

    end

  end

  # TODO add more
end
