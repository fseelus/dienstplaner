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

ActiveRecord::Schema[7.0].define(version: 2022_02_28_152757) do
  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.integer "estate_id", null: false
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estate_id"], name: "index_buildings_on_estate_id"
    t.index ["organization_id"], name: "index_buildings_on_organization_id"
  end

  create_table "estates", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "zipcode"
    t.string "street"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_estates_on_organization_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "building_id", null: false
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_floors_on_building_id"
    t.index ["organization_id"], name: "index_floors_on_organization_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_memberships_on_organization_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.integer "employee_id", null: false
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_schedules_on_creator_id"
    t.index ["employee_id"], name: "index_schedules_on_employee_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.string "name"
    t.date "startdate"
    t.date "enddate"
    t.integer "floor_id", null: false
    t.integer "employee_id", null: false
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bgcolor_id"
    t.integer "building_id"
    t.integer "estate_id"
    t.integer "schedule_id"
    t.index ["building_id"], name: "index_shifts_on_building_id"
    t.index ["creator_id"], name: "index_shifts_on_creator_id"
    t.index ["employee_id"], name: "index_shifts_on_employee_id"
    t.index ["estate_id"], name: "index_shifts_on_estate_id"
    t.index ["floor_id"], name: "index_shifts_on_floor_id"
    t.index ["schedule_id"], name: "index_shifts_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buildings", "estates"
  add_foreign_key "buildings", "organizations"
  add_foreign_key "estates", "organizations"
  add_foreign_key "floors", "buildings"
  add_foreign_key "floors", "organizations"
  add_foreign_key "memberships", "organizations"
  add_foreign_key "memberships", "users"
  add_foreign_key "schedules", "users", column: "creator_id"
  add_foreign_key "schedules", "users", column: "employee_id"
  add_foreign_key "shifts", "buildings"
  add_foreign_key "shifts", "estates"
  add_foreign_key "shifts", "floors"
  add_foreign_key "shifts", "schedules"
  add_foreign_key "shifts", "users", column: "creator_id"
  add_foreign_key "shifts", "users", column: "employee_id"
end
