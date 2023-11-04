require "rails_helper"

RSpec.describe Notices::Webhooks do
  describe ".execute" do
    before do
      allow(described_class::Discord).to receive(:enabled?).and_return(true)
      allow(described_class::Discord).to receive(:new).with(notice).and_return(target_discord)
    end

    let(:notice) { instance_double(Notice) }

    let(:target_discord) { instance_double(described_class::Discord, execute: nil) }

    it "executes all enabled implementations" do
      described_class.execute(notice)

      expect(target_discord).to have_received(:execute)
    end
  end
end
