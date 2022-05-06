require "rails_helper"

RSpec.describe "POST /api/v3/notices" do
  context "with a known project id" do
    let(:project) { FactoryBot.create :project }

    context "without a valid token" do
      it "renders an http 401 error" do
        post "/api/v3/projects/#{project.id}/notices"

        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
