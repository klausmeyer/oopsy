require "rails_helper"

RSpec.describe Notices::Webhooks::Discord do
  subject(:instance) { described_class.new(notice) }

  let(:notice) { FactoryBot.create :notice }

  describe "#execute" do
    before do
      FactoryBot.create_list :error, 2, notice: notice

      allow(ENV).to receive(:fetch).with("WEBHOOK_DISCORD_URL").and_return(webhook_url)
    end

    let(:webhook_url) { "https://discord.com/api/webhooks/123/456" }

    let!(:webhook_request) do
      stub_request(:post, webhook_url).to_return(status: 200)
    end

    it "..." do
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
  end
end
