# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.find_or_create_by!(email: "admin@example.com") do |u|
  u.first_name = "Admin"
  u.last_name  = "User"
  u.password   = "password"
end

project = Project.find_or_create_by!(name: "Demo Project")

return if Notice.any?

5.times do
  notice = Notice.create!(
    project: project,
    raw:     JSON.parse(
      File.read(Rails.root.join("spec/fixtures/files/airbrake/create-notice-v3-request-body.json"))
    )
  )

  Notices::ParseRawDataJob.perform_now(notice)
end

Errors::CollectErrorUnities.call
