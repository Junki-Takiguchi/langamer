# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_07_091113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friend_relations", force: :cascade do |t|
    t.integer "from_applicant_id"
    t.integer "to_target_id"
    t.integer "status", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_applicant_id", "to_target_id"], name: "index_friend_relations_on_from_applicant_id_and_to_target_id", unique: true
    t.index ["from_applicant_id"], name: "index_friend_relations_on_from_applicant_id"
    t.index ["to_target_id"], name: "index_friend_relations_on_to_target_id"
  end

  create_table "game_accounts", force: :cascade do |t|
    t.string "discord_id"
    t.string "steam_id"
    t.string "origin_id"
    t.string "riot_id"
    t.string "psn_id"
    t.string "xbox_id"
    t.string "nintendo_id"
    t.string "other_id"
    t.string "twitter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "discord_id_status", limit: 2, default: 2, null: false
    t.integer "steam_id_status", limit: 2, default: 2, null: false
    t.integer "origin_id_status", limit: 2, default: 2, null: false
    t.integer "riot_id_status", limit: 2, default: 2, null: false
    t.integer "psn_id_status", limit: 2, default: 2, null: false
    t.integer "xbox_id_status", limit: 2, default: 2, null: false
    t.integer "nintendo_id_status", limit: 2, default: 2, null: false
    t.integer "other_id_status", limit: 2, default: 2, null: false
    t.integer "twitter_id_status", limit: 2, default: 2, null: false
    t.index ["user_id"], name: "index_game_accounts_on_user_id"
  end

  create_table "game_platforms", force: :cascade do |t|
    t.string "name"
    t.text "game_platform_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_relations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id", null: false
    t.bigint "game_platform_id", null: false
    t.index ["game_id"], name: "index_game_relations_on_game_id"
    t.index ["game_platform_id"], name: "index_game_relations_on_game_platform_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "game_picture"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "learn_languages", force: :cascade do |t|
    t.string "learn_language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_learn_languages_on_user_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recruitments_on_user_id"
  end

  create_table "speak_languages", force: :cascade do |t|
    t.string "speak_language"
    t.boolean "native_language", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_speak_languages_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "account_name"
    t.text "profile_picture"
    t.text "self_introduction"
    t.string "learn_language"
    t.string "first_language"
    t.string "second_language"
    t.string "living_country"
    t.string "native_country"
    t.date "date_of_birth"
    t.integer "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "second_language_status", limit: 2, default: 0, null: false
    t.integer "living_country_status", limit: 2, default: 0, null: false
    t.integer "native_country_status", limit: 2, default: 0, null: false
    t.integer "date_of_birth_status", limit: 2, default: 0, null: false
    t.integer "gender_status", limit: 2, default: 0, null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "game_accounts", "users"
  add_foreign_key "game_relations", "game_platforms"
  add_foreign_key "game_relations", "games"
  add_foreign_key "games", "users"
  add_foreign_key "learn_languages", "users"
  add_foreign_key "recruitments", "users"
  add_foreign_key "speak_languages", "users"
  add_foreign_key "user_details", "users"
end
