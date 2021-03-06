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

ActiveRecord::Schema[7.0].define(version: 2022_06_21_221046) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disease_patients", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_disease_patients_on_disease_id"
    t.index ["patient_id"], name: "index_disease_patients_on_patient_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "tax_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "photo"
    t.string "uid"
    t.string "phone"
    t.integer "age"
    t.bigint "health_professional_id"
    t.bigint "patient_id"
    t.index ["health_professional_id"], name: "index_entities_on_health_professional_id"
    t.index ["patient_id"], name: "index_entities_on_patient_id"
    t.index ["uid"], name: "index_entities_on_uid"
  end

  create_table "health_professionals", force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profession_id"
    t.index ["entity_id"], name: "index_health_professionals_on_entity_id"
    t.index ["profession_id"], name: "index_health_professionals_on_profession_id"
  end

  create_table "medical_cares", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "health_professional_id", null: false
    t.boolean "attended"
    t.datetime "date"
    t.boolean "canceled", default: false
    t.index ["health_professional_id"], name: "index_medical_cares_on_health_professional_id"
    t.index ["patient_id"], name: "index_medical_cares_on_patient_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "health_professional_id"
    t.text "observations"
    t.index ["health_professional_id"], name: "index_medical_records_on_health_professional_id"
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
  end

  create_table "medicine_lines", force: :cascade do |t|
    t.bigint "medicine_id", null: false
    t.bigint "medical_record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_record_id"], name: "index_medicine_lines_on_medical_record_id"
    t.index ["medicine_id"], name: "index_medicine_lines_on_medicine_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.string "management"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_patients_on_entity_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_reviews_on_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "disease_patients", "diseases"
  add_foreign_key "disease_patients", "patients"
  add_foreign_key "entities", "health_professionals"
  add_foreign_key "entities", "patients"
  add_foreign_key "health_professionals", "entities"
  add_foreign_key "health_professionals", "professions"
  add_foreign_key "medical_cares", "health_professionals"
  add_foreign_key "medical_cares", "patients"
  add_foreign_key "medical_records", "health_professionals"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "medicine_lines", "medical_records"
  add_foreign_key "medicine_lines", "medicines"
  add_foreign_key "patients", "entities"
  add_foreign_key "reviews", "entities"
end
