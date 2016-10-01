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

ActiveRecord::Schema.define(version: 20161001003536) do

  create_table "appointments", force: :cascade do |t|
    t.string   "name"
    t.integer  "hoac_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "doctor_id"
    t.date     "appointment_date"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["hoac_user_id"], name: "index_appointments_on_hoac_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.integer  "department_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "uid"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.index ["department_id"], name: "index_doctors_on_department_id"
  end

  create_table "hoac_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "mobile_number"
    t.date     "dob"
    t.string   "gender"
    t.string   "city"
    t.string   "street"
    t.index ["email"], name: "index_hoac_users_on_email", unique: true
  end

end
