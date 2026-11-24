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

ActiveRecord::Schema[8.1].define(version: 2026_11_24_113644) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_checklists_on_procedure_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.boolean "checked"
    t.bigint "checklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_documents_on_checklist_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "role"
    t.text "content"
    t.bigint "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_id"], name: "index_messages_on_procedure_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.text "system_prompt"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_procedures_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.text "description"
    t.boolean "checked"
    t.bigint "checklist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_steps_on_checklist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checklists", "procedures"
  add_foreign_key "documents", "checklists"
  add_foreign_key "messages", "procedures"
  add_foreign_key "procedures", "users"
  add_foreign_key "steps", "checklists"
end
