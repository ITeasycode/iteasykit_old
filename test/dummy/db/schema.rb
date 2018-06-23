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

ActiveRecord::Schema.define(version: 2018_04_07_025758) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.string "locale"
    t.index ["locale"], name: "index_friendly_id_slugs_on_locale"
    t.index ["slug", "sluggable_type", "locale"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale"
    t.index ["slug", "sluggable_type", "scope", "locale"], name: "index_friendly_id_slugs_uniqueness", unique: true
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "iteasykit_block_translations", force: :cascade do |t|
    t.integer "iteasykit_block_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_name"
    t.text "description_admin"
    t.index ["iteasykit_block_id"], name: "index_iteasykit_block_translations_on_iteasykit_block_id"
    t.index ["locale"], name: "index_iteasykit_block_translations_on_locale"
  end

  create_table "iteasykit_blocks", force: :cascade do |t|
    t.string "region"
    t.string "type_url"
    t.text "url"
    t.string "etl_type"
    t.text "entity_type_lists"
    t.string "machine_name"
    t.boolean "active"
    t.integer "position"
    t.boolean "system"
    t.integer "iteasykit_entity_type_id"
    t.string "elementcls"
    t.string "idcls"
    t.string "csscls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iteasykit_entity_type_id"], name: "index_iteasykit_blocks_on_iteasykit_entity_type_id"
  end

  create_table "iteasykit_entity_type_translations", force: :cascade do |t|
    t.integer "iteasykit_entity_type_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.text "help"
    t.index ["iteasykit_entity_type_id"], name: "index_48639a522c86749428547454744d196eb0a30474"
    t.index ["locale"], name: "index_iteasykit_entity_type_translations_on_locale"
  end

  create_table "iteasykit_entity_types", force: :cascade do |t|
    t.string "machine_name"
    t.string "rel_model"
    t.boolean "active"
    t.boolean "nesting"
    t.boolean "relation"
    t.boolean "path_root_url"
    t.boolean "comment"
    t.boolean "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iteasykit_menu_item_translations", force: :cascade do |t|
    t.integer "iteasykit_menu_item_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "title"
    t.string "url"
    t.index ["iteasykit_menu_item_id"], name: "index_b51ca72d3b48567a64bdb5c56b09607dd81f81e7"
    t.index ["locale"], name: "index_iteasykit_menu_item_translations_on_locale"
  end

  create_table "iteasykit_menu_items", force: :cascade do |t|
    t.string "itemable_type"
    t.integer "itemable_id"
    t.integer "iteasykit_menu_id"
    t.string "ancestry"
    t.integer "ancestry_depth", default: 0
    t.boolean "active"
    t.integer "position"
    t.boolean "blocked"
    t.string "elementcls"
    t.string "idcls"
    t.string "csscls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_iteasykit_menu_items_on_ancestry"
    t.index ["iteasykit_menu_id"], name: "index_iteasykit_menu_items_on_iteasykit_menu_id"
    t.index ["itemable_type"], name: "ib"
  end

  create_table "iteasykit_menu_translations", force: :cascade do |t|
    t.integer "iteasykit_menu_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["iteasykit_menu_id"], name: "index_iteasykit_menu_translations_on_iteasykit_menu_id"
    t.index ["locale"], name: "index_iteasykit_menu_translations_on_locale"
  end

  create_table "iteasykit_menus", force: :cascade do |t|
    t.boolean "active"
    t.string "machine_name"
    t.string "elementcls"
    t.string "idcls"
    t.string "csscls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iteasykit_users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_iteasykit_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_iteasykit_users_on_reset_password_token", unique: true
  end

end
