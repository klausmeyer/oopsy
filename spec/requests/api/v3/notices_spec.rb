require "rails_helper"

RSpec.describe "POST /api/v3/notices" do
  context "with a known project id" do
    let(:project) { FactoryBot.create :project }

    context "with a valid token" do
      let(:headers) do
        { "Authorization" => "Bearer #{project.api_key}" }
      end

      context "with the correct project_id" do
        it "renders a http 201 response" do
          post "/api/v3/projects/#{project.id}/notices", params: {}.to_json, headers: headers

          expect(response).to have_http_status :created
        end
      end

      context "with another project_id" do
        it "renders a http 201 response" do
          post "/api/v3/projects/9999/notices", params: {}.to_json, headers: headers

          expect(response).to have_http_status :created
        end
      end
    end

    context "without a valid token" do
      it "renders an http 401 error" do
        post "/api/v3/projects/#{project.id}/notices"

        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
