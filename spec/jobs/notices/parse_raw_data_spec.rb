require "rails_helper"

RSpec.describe Notices::ParseRawDataJob do
  subject(:job) { described_class.new }

  let(:notice) { FactoryBot.create :notice, raw: JSON.parse(file_fixture("airbrake/create-notice-v3-request-body.json").read) }

  describe "#perform" do
    it "parses the raw json and creates errors from it" do
      expect { job.perform(notice) }.to change { notice.error_occurrences.count }.from(0).to(2)

      error = notice.error_occurrences.last
      expect(error.error_type).to eq "error1"
      expect(error.error_message).to eq "message1"
      expect(error.backtrace).to eq [
        "code"     => {"1" => "code", "2" => "more code"},
        "file"     => "backtrace file",
        "function" => "backtrace function",
        "line"     => 10
      ]
    end
  end
end
