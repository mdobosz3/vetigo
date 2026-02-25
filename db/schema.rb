ActiveRecord::Schema[8.1].define(version: 2026_02_25_211644) do
  enable_extension "pg_catalog.plpgsql"

  create_table "pets", force: :cascade do |t|
    t.integer "age"
    t.string "breed"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "species"
    t.datetime "updated_at", null: false
  end
end
