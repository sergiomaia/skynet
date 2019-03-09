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

ActiveRecord::Schema.define(version: 2019_03_09_013521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "customers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.date "birthdate"
    t.string "phone"
    t.string "cellphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gadgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "card"
    t.string "nds"
    t.string "model"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "gadget_id"
    t.integer "plan"
    t.float "value"
    t.date "expires_at"
    t.integer "status"
    t.string "protocol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_packages_on_customer_id"
    t.index ["gadget_id"], name: "index_packages_on_gadget_id"
  end

end
