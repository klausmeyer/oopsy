# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveJob::Base.queue_adapter = :inline

User.find_or_create_by!(email: "admin@example.com") do |u|
  u.first_name = "Admin"
  u.last_name  = "User"
  u.password   = "password"
end

return if Notice.any?

3.times do |index|
  project = Project.find_or_create_by!(name: "Demo Project #{index + 1}")

  3.times do
    Notices::CreateFromRaw.new(
      project: project,
      raw:     File.read(Rails.root.join("spec/fixtures/files/airbrake/create-notice-v3-request-body.json"))
    ).call
  end
end
