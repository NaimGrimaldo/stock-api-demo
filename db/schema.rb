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

ActiveRecord::Schema[7.0].define(version: 2023_04_22_213832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "owner_type", null: false
    t.uuid "owner_id", null: false
    t.string "street", null: false
    t.string "exterior_number", null: false
    t.string "interior_number"
    t.string "neighborhood", null: false
    t.string "municipality"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["owner_type", "owner_id"], name: "index_addresses_on_owner"
  end

  create_table "base_measurement_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_base_measurement_units_on_deleted_at"
  end

  create_table "brands", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_brands_on_deleted_at"
  end

  create_table "customers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "legal_name"
    t.string "nickname", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "maternal_last_name"
    t.date "birth_date"
    t.string "email"
    t.string "phone"
    t.integer "gender"
    t.string "rfc"
    t.string "curp"
    t.string "nationality"
    t.integer "customer_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_customers_on_deleted_at"
  end

  create_table "product_presentations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "factor_per_item", default: 1, null: false
    t.string "nickname"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_product_presentations_on_deleted_at"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description", null: false
    t.serial "internal_id", null: false
    t.decimal "purchase_price", default: "0.0", null: false
    t.decimal "sale_price", default: "0.0", null: false
    t.uuid "brand_id", null: false
    t.integer "stock_quantity", default: 0, null: false
    t.integer "min_stock_quantity", default: 0, null: false
    t.integer "max_stock_quantity", default: 0, null: false
    t.integer "status"
    t.uuid "base_measurement_unit_id", null: false
    t.uuid "product_presentation_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_measurement_unit_id"], name: "index_products_on_base_measurement_unit_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
    t.index ["product_presentation_id"], name: "index_products_on_product_presentation_id"
  end

  create_table "providers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "legal_name"
    t.string "nickname", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "maternal_last_name"
    t.date "birth_date"
    t.string "email", null: false
    t.string "phone", null: false
    t.string "website"
    t.string "rfc"
    t.string "curp"
    t.string "nationality"
    t.serial "internal_id", null: false
    t.date "starts_on"
    t.integer "provider_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_providers_on_deleted_at"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "owner_type", null: false
    t.uuid "owner_id", null: false
    t.uuid "user_id"
    t.integer "transaction_type"
    t.integer "status", default: 0, null: false
    t.uuid "product_id", null: false
    t.integer "quantity"
    t.decimal "total"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_transactions_on_deleted_at"
    t.index ["owner_type", "owner_id"], name: "index_transactions_on_owner"
    t.index ["product_id"], name: "index_transactions_on_product_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "maternal_last_name"
    t.date "birth_date"
    t.string "email", null: false
    t.string "phone", null: false
    t.integer "gender"
    t.string "rfc"
    t.string "curp"
    t.string "nationality"
    t.integer "role"
    t.serial "internal_id", null: false
    t.date "starts_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "products", "base_measurement_units"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "product_presentations"
  add_foreign_key "transactions", "products"
  add_foreign_key "transactions", "users"
end
