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

ActiveRecord::Schema.define(version: 2018_06_05_102341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_classes", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "department_id"
    t.index ["department_id"], name: "index_expense_classes_on_department_id"
    t.index ["project_id"], name: "index_expense_classes_on_project_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "project_id"
    t.string "class_name"
    t.string "name"
    t.date "billing_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "unit"
    t.float "unit_price"
    t.boolean "deleted"
    t.date "deleted_at"
    t.index ["project_id"], name: "index_expenses_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "project_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expense_classes", "departments"
  add_foreign_key "expense_classes", "projects"
  add_foreign_key "expenses", "projects"
end
