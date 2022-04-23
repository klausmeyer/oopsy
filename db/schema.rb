# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_23_171226) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "error_occurrences", force: :cascade do |t|
    t.bigint "notice_id", null: false
    t.string "error_type"
    t.string "error_message"
    t.json "backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notice_id"], name: "index_error_occurrences_on_notice_id"
  end

  create_table "notices", force: :cascade do |t|
    t.json "context"
    t.json "environment"
    t.json "session"
    t.json "params"
    t.json "raw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "error_occurrences", "notices"
end
