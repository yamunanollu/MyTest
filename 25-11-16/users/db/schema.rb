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

ActiveRecord::Schema.define(version: 20161125101854) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "address1",   limit: 65535
    t.text     "address2",   limit: 65535
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip"
    t.integer  "fax"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_type"
    t.text     "address1",     limit: 65535
    t.text     "address2",     limit: 65535
    t.string   "city"
    t.string   "phone_number"
    t.string   "state"
    t.string   "country"
    t.string   "birthday"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "phone"
    t.string   "email"
    t.string   "last_name"
    t.integer  "fax"
    t.string   "cell"
    t.text     "address",            limit: 65535
    t.integer  "rank_id"
    t.string   "gender"
    t.string   "education"
    t.string   "hometown"
    t.text     "story",              limit: 65535
    t.string   "movies"
    t.string   "phone_visibility"
    t.string   "email_visibility"
    t.string   "address_visibility"
    t.string   "other_emails"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "gender"
    t.string   "preferred_language"
    t.string   "other_email"
    t.integer  "phone"
    t.string   "mobile"
    t.string   "rank_id"
    t.string   "username"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "paid_rank_id"
    t.integer  "profile_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "profiles"
end
