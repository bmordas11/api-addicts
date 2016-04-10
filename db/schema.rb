ActiveRecord::Schema.define(version: 20160407144439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tags", force: :cascade do |t|
    t.integer  "api_id",     null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apis", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "url",         null: false
    t.text     "description", null: false
    t.boolean  "paid",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id",     null: false
  end

  add_index "apis", ["user_id"], name: "index_apis_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "rating",     null: false
    t.integer  "user_id",    null: false
    t.integer  "api_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
