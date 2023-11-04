require "rails_helper"

RSpec.describe Notices::ExecuteWebhooksJob do
  subject(:job) { described_class.new }

  let(:notice) { FactoryBot.create :notice }

  describe "#perform" do
    before do
      allow(Notices::Webhooks).to receive(:execute)
    end

    it "delegates to the webhooks implementation" do
      job.perform(notice)

      expect(Notices::Webhooks).to have_received(:execute).with(notice)
    end
  end
end
