require "rails_helper"

RSpec.describe Notices::ParseRawDataJob do
  subject(:job) { described_class.new }

  let(:notice) { FactoryBot.create :notice, raw: JSON.parse(file_fixture("airbrake/create-notice-v3-request-body.json").read) }

  describe "#perform" do
    it "parses the raw json and creates errors from it" do
      expect { job.perform(notice) }.to change { notice.reported_errors.count }.from(0).to(2)

      error = notice.reported_errors.last
      expect(error.error_type).to eq "error1"
      expect(error.error_message).to eq "message1"
      expect(error.backtrace).to eq [
        "code"     => {"1" => "code", "2" => "more code"},
        "file"     => "backtrace file",
        "function" => "backtrace function",
        "line"     => 10
      ]

      expect(notice.reload.state).to eq "parsed"
    end

    it "enqueues a follow-up job to create groups" do
      ActiveJob::Base.queue_adapter = :test

      expect { job.perform(notice) }.to have_enqueued_job Errors::GroupJob
    end

    context "when webhooks are enabled" do
      before do
        allow(Notices::Webhooks).to receive(:enabled?).and_return(true)
      end

      it "enqueues a follow-up job to execute a webhook" do
        ActiveJob::Base.queue_adapter = :test

        expect { job.perform(notice) }.to have_enqueued_job(Notices::ExecuteWebhooksJob).with(notice)
      end
    end
  end
end
