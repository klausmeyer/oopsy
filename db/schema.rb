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

ActiveRecord::Schema[8.1].define(version: 2025_10_23_064742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "error_groups", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "name"], name: "index_error_groups_on_project_id_and_name", unique: true
    t.index ["project_id"], name: "index_error_groups_on_project_id"
  end

  create_table "errors", force: :cascade do |t|
    t.bigint "notice_id", null: false
    t.bigint "error_group_id"
    t.string "error_type"
    t.string "error_message"
    t.json "backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["error_group_id"], name: "index_errors_on_error_group_id"
    t.index ["notice_id"], name: "index_errors_on_notice_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "uuid"
    t.bigint "project_id", null: false
    t.string "state", default: "received", null: false
    t.json "context"
    t.json "environment"
    t.json "session"
    t.json "params"
    t.json "raw", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_notices_on_project_id"
    t.index ["uuid"], name: "index_notices_on_uuid", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_projects_on_api_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "errors", "error_groups"
  add_foreign_key "errors", "notices"
end
