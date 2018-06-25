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

ActiveRecord::Schema.define(version: 2018_06_20_100546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contract_expenses", force: :cascade do |t|
    t.date "date"
    t.integer "unit_price"
    t.integer "unit"
    t.bigint "expense_master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.bigint "project_id"
    t.boolean "expense_created", default: false
    t.integer "status", limit: 2, default: 0, null: false
    t.index ["expense_master_id"], name: "index_contract_expenses_on_expense_master_id"
    t.index ["project_id"], name: "index_contract_expenses_on_project_id"
    t.index ["status"], name: "index_contract_expenses_on_status"
  end

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

  create_table "expense_masters", force: :cascade do |t|
    t.string "name"
    t.bigint "expense_class_id"
    t.string "unit_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.index ["expense_class_id"], name: "index_expense_masters_on_expense_class_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "project_id"
    t.date "billing_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "unit"
    t.float "unit_price"
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.integer "expense_type", limit: 2, default: 0, null: false
    t.bigint "contract_expense_id"
    t.index ["contract_expense_id"], name: "index_expenses_on_contract_expense_id"
    t.index ["project_id"], name: "index_expenses_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "project_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contract_expenses", "expense_masters"
  add_foreign_key "contract_expenses", "projects"
  add_foreign_key "expense_classes", "departments"
  add_foreign_key "expense_classes", "projects"
  add_foreign_key "expense_masters", "expense_classes"
  add_foreign_key "expenses", "contract_expenses"
  add_foreign_key "expenses", "projects"
end
