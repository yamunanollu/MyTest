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

ActiveRecord::Schema.define(version: 20161109051921) do

  create_table "forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "gender"
    t.string   "preferred_language"
    t.string   "email"
    t.string   "other_email"
    t.integer  "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "rank_id"
    t.text     "address1",              limit: 65535
    t.text     "address2",              limit: 65535
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip"
    t.string   "username"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "paid_rank_id"
  end

  create_table "registers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", primary_key: "student_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "stud_name",       limit: 20
    t.string  "father_name",     limit: 20
    t.string  "mother_name",     limit: 20
    t.string  "student_address", limit: 50
    t.integer "mobile"
    t.integer "user_id"
    t.index ["user_id"], name: "fk_rails_148c9e88f4", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "email_confirmation"
    t.integer "contact"
    t.integer "contact2"
    t.text    "Address",            limit: 65535
    t.string  "city"
    t.string  "state"
    t.integer "zipcode"
  end

end
