require "rails_helper"

require_relative "../support/rack_server"

RSpec.describe "Airbrake compatibility" do
  include RackServer

  before :all do
    local_server_start
    local_server_wait

    project = FactoryBot.create :project

    Airbrake.configure do |c|
      c.host          = "http://127.0.0.1:3000"
      c.project_id    = project.id
      c.project_key   = project.api_key
      c.remote_config = false
      c.logger        = Rails.logger
    end
  end

  let(:error) do
    RuntimeError.new "Something went wrong"
  end

  it "is possible to push errors via the official airbrake-ruby gem" do
    result = Airbrake.notify_sync(error)

    expect(result).to be_a Hash
    expect(result).to have_key "id"
    expect(result).to have_key "url"
  end

  it "persists the error in the database" do
    expect { Airbrake.notify_sync(error) }.to change(Notice, :count).by(1)
  end
end
