ActiveRecord::Schema.define(version: 20160405144915) do
  enable_extension "plpgsql"

  create_table "apis", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "url",         null: false
    t.text     "description", null: false
    t.boolean  "paid",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
end
