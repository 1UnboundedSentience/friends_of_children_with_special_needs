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

ActiveRecord::Schema.define(version: 20160530125602) do

  create_table "course_dates", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_times", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "military_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "registration_start"
    t.datetime "registration_end"
    t.integer  "instructor_id"
    t.integer  "coordinator_id"
    t.integer  "fees_in_cents"
    t.text     "comments"
    t.integer  "lowest_age"
    t.integer  "highest_age"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "email"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "work_phone"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "registration_items", force: :cascade do |t|
    t.integer  "registration_id"
    t.integer  "course_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.text     "signature_svg"
    t.boolean  "photo_waiver"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "status",        default: "enrolled"
    t.integer  "student_id"
  end

  create_table "shopping_basket_items", force: :cascade do |t|
    t.integer  "shopping_basket_id"
    t.integer  "course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "shopping_baskets", force: :cascade do |t|
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_contacts", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "student_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "relationship_to_student"
    t.integer  "emergency_contact_order"
  end

  create_table "students", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "allergies"
    t.date     "birthday"
    t.string   "gender"
    t.string   "diagnosis"
    t.string   "talents"
    t.text     "comment"
    t.boolean  "behavior_intervention_plan"
    t.boolean  "one_on_one_aide"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_admin"
    t.boolean  "is_coordinator"
    t.boolean  "is_instructor"
    t.boolean  "is_parent"
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
