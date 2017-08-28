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

ActiveRecord::Schema.define(version: 20170828004040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   default: "discord",                             null: false
    t.integer  "user_id",                                                    null: false
    t.string   "uid",                                                        null: false
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }, null: false
    t.datetime "updated_at", default: -> { "timezone('utc'::text, now())" }, null: false
  end

# Could not dump table "meeting_types" because of following StandardError
#   Unknown type 'meeting_type' for column 'name'

  create_table "meetings", force: :cascade do |t|
    t.datetime "start_time",                                                      null: false
    t.datetime "end_time",                                                        null: false
    t.boolean  "completed"
    t.integer  "coachee_id"
    t.integer  "coach_id"
    t.string   "notes"
    t.integer  "meeting_type_id",                                                 null: false
    t.datetime "created_at",      default: -> { "timezone('utc'::text, now())" }, null: false
    t.datetime "updated_at",      default: -> { "timezone('utc'::text, now())" }, null: false
    t.index ["coach_id"], name: "index_meetings_on_coach_id", using: :btree
    t.index ["coachee_id"], name: "index_meetings_on_coachee_id", using: :btree
    t.index ["meeting_type_id"], name: "index_meetings_on_meeting_type_id", using: :btree
  end

  create_table "referrals", force: :cascade do |t|
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }, null: false
    t.datetime "updated_at", default: -> { "timezone('utc'::text, now())" }, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "meeting_id",                                                  null: false
    t.string   "review_text",                                                 null: false
    t.datetime "created_at",  default: -> { "timezone('utc'::text, now())" }, null: false
    t.datetime "updated_at",  default: -> { "timezone('utc'::text, now())" }, null: false
    t.index ["meeting_id"], name: "index_reviews_on_meeting_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                                       null: false
    t.string   "email",      default: "",                                    null: false
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }, null: false
    t.datetime "updated_at", default: -> { "timezone('utc'::text, now())" }, null: false
  end

  add_foreign_key "authorizations", "users"
  add_foreign_key "meetings", "meeting_types"
  add_foreign_key "meetings", "users", column: "coach_id"
  add_foreign_key "meetings", "users", column: "coachee_id"
  add_foreign_key "reviews", "meetings"
end
