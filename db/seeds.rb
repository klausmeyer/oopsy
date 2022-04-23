# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Notice.first_or_create!(
  raw: JSON.parse(
    File.read(Rails.root.join("spec/fixtures/files/airbrake/create-notice-v3-request-body.json"))
  )
)
