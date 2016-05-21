# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160521053518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blazer_audits", force: true do |t|
    t.integer  "user_id"
    t.integer  "query_id"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at"
  end

  create_table "blazer_checks", force: true do |t|
    t.integer  "creator_id"
    t.integer  "query_id"
    t.string   "state"
    t.string   "schedule"
    t.text     "emails"
    t.boolean  "invert"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blazer_dashboard_queries", force: true do |t|
    t.integer  "dashboard_id"
    t.integer  "query_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blazer_dashboards", force: true do |t|
    t.integer  "creator_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blazer_queries", force: true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.text     "statement"
    t.string   "data_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_friends", force: true do |t|
    t.integer  "owner_id"
    t.integer  "user_id",           limit: 8
    t.string   "relationship"
    t.string   "source"
    t.string   "screen_name"
    t.string   "name"
    t.string   "profile_image_url"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "meetings", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_settings", force: true do |t|
    t.boolean  "signup_completed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                   default: "",      null: false
    t.string   "encrypted_password",      default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",       default: 0
    t.string   "uid"
    t.string   "avatar"
    t.integer  "longitude"
    t.integer  "latitude"
    t.string   "address"
    t.string   "username"
    t.boolean  "active_status",           default: false
    t.string   "email_frequency",         default: "daily"
    t.boolean  "loc_bushwick",            default: false
    t.boolean  "loc_downtown",            default: false
    t.boolean  "loc_harlem",              default: false
    t.boolean  "loc_midtown",             default: false
    t.boolean  "loc_queens",              default: false
    t.boolean  "loc_redhook",             default: false
    t.boolean  "loc_ues",                 default: false
    t.boolean  "loc_uws",                 default: false
    t.boolean  "loc_williamsburg",        default: false
    t.boolean  "dow_mo",                  default: false
    t.boolean  "dow_tu",                  default: false
    t.boolean  "dow_we",                  default: false
    t.boolean  "dow_th",                  default: false
    t.boolean  "dow_fr",                  default: false
    t.boolean  "dow_sa",                  default: false
    t.boolean  "dow_su",                  default: false
    t.integer  "twitter_followers_count", default: 0
    t.integer  "twitter_friends_count",   default: 0
    t.string   "twitter_access_token"
    t.string   "description",             default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
