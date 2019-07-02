# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_02_061354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "request_applications", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "request_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_request_applications_on_applicant_id"
    t.index ["request_id"], name: "index_request_applications_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "request_detail"
    t.string "location"
    t.text "requirements"
    t.string "contact"
    t.datetime "startDateTime"
    t.datetime "endDateTime"
    t.bigint "creator_id"
    t.string "status", default: "open"
    t.integer "recruitment_number"
    t.index ["creator_id"], name: "index_requests_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.date "birthdate"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  add_foreign_key "request_applications", "requests"
  add_foreign_key "request_applications", "users", column: "applicant_id"
  add_foreign_key "requests", "users", column: "creator_id"
end
