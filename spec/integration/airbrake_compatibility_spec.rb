require "rails_helper"

require_relative "../support/rack_server"

RSpec.describe "Airbrake compatibility" do
  include RackServer

  before :all do
    local_server_start
    local_server_wait
  end

  before do
    Airbrake.configure do |c|
      c.host          = "http://127.0.0.1:3000"
      c.project_id    = 105138
      c.project_key   = "fd04e13d806a90f96614ad8e529b2822"
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
