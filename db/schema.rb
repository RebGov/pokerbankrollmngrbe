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

ActiveRecord::Schema.define(version: 2018_11_01_233153) do

  create_table "blinds_names", force: :cascade do |t|
    t.string "blinds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_locations", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_names", force: :cascade do |t|
    t.string "game_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "note"
    t.integer "played_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["played_game_id"], name: "index_notes_on_played_game_id"
  end

  create_table "played_games", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.integer "buy_in"
    t.integer "cash_out"
    t.integer "game_location_id"
    t.integer "game_name_id"
    t.integer "blinds_name_id"
    t.boolean "tournament"
    t.string "tournament_placement"
    t.datetime "tournament_date"
    t.string "tournament_name"
    t.integer "profit"
    t.integer "minutes"
    t.boolean "won_game"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blinds_name_id"], name: "index_played_games_on_blinds_name_id"
    t.index ["game_location_id"], name: "index_played_games_on_game_location_id"
    t.index ["game_name_id"], name: "index_played_games_on_game_name_id"
    t.index ["user_id"], name: "index_played_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "read_and_accepted_terms_of_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
