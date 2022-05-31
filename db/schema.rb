ActiveRecord::Schema[7.0].define(version: 2022_05_31_142504) do
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.integer "measurement_unit", null: false
    t.decimal "price", default: "0.0"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "recipe_foods", force: :cascade do |t|
    t.integer "quantity", null: false
    t.bigint "recipes_id", null: false
    t.bigint "foods_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foods_id"], name: "index_recipe_foods_on_foods_id"
    t.index ["recipes_id"], name: "index_recipe_foods_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.string "description", null: false
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
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

  add_foreign_key "foods", "users"
  add_foreign_key "recipe_foods", "foods", column: "foods_id"
  add_foreign_key "recipe_foods", "recipes", column: "recipes_id"
  add_foreign_key "recipes", "users"
end
