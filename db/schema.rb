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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_194027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "tax_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
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
    t.index ["health_professional_id"], name: "index_medical_cares_on_health_professional_id"
    t.index ["patient_id"], name: "index_medical_cares_on_patient_id"
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

  add_foreign_key "health_professionals", "entities"
  add_foreign_key "health_professionals", "professions"
  add_foreign_key "medical_cares", "health_professionals"
  add_foreign_key "medical_cares", "patients"
  add_foreign_key "patients", "entities"
  add_foreign_key "reviews", "entities"
end
