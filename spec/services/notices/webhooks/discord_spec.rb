require "rails_helper"

RSpec.describe Notices::Webhooks::Discord do
  subject(:instance) { described_class.new(notice) }

  let(:notice) { FactoryBot.create :notice }

  describe ".enabled?" do
    subject { described_class.enabled? }

    context "when the environment variable is not set" do
      it { is_expected.to be false }
    end

    context "when the environment variable is set" do
      before do
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:[]).with("WEBHOOK_DISCORD_ENABLED").and_return("true")
      end

      it { is_expected.to be true }
    end
  end

  describe "#execute" do
    before do
      FactoryBot.create_list :error, 2, notice: notice

      allow(ENV).to receive(:fetch).with("WEBHOOK_DISCORD_URL").and_return(webhook_url)
    end

    let(:webhook_url) { "https://discord.com/api/webhooks/123/456" }
    let(:response_status) { 200 }

    let!(:webhook_request) do
      stub_request(:post, webhook_url).to_return(status: response_status)
    end

    it "sends the correct request to the configured url" do
      instance.execute

      expect(webhook_request.with do |req|
        expect(req.headers["Content-Type"]).to eq "application/json"
        expect(req.body).to eq({
          embeds: [{
            title:       "Project «#{notice.project.name}» has 2 new errors",
            description: "* `ErrorType`\n* `ErrorType`",
            url:         "http://localhost:3000/web/notices/#{notice.id}"
          }]
        }.to_json)
      end).to have_been_made
    end

    context "when the webhook is not accepted" do
      let(:response_status) { 500 }

      it "raises an error" do
        expect { instance.execute }.to raise_error Faraday::ServerError
      end
    end
  end
end
