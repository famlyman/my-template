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

ActiveRecord::Schema[7.0].define(version: 2023_09_15_005328) do
  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_leagues_on_slug", unique: true
  end

  create_table "leagues_seasons", id: false, force: :cascade do |t|
    t.integer "season_id", null: false
    t.integer "league_id", null: false
    t.index ["league_id", "season_id"], name: "index_leagues_seasons_on_league_id_and_season_id"
    t.index ["season_id", "league_id"], name: "index_leagues_seasons_on_season_id_and_league_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "date"
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.integer "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["schedule_id"], name: "index_matches_on_schedule_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_players_on_slug", unique: true
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.index ["player_id", "team_id"], name: "index_players_teams_on_player_id_and_team_id"
    t.index ["team_id", "player_id"], name: "index_players_teams_on_team_id_and_player_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "date"
    t.time "time"
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_schedules_on_away_team_id"
    t.index ["home_team_id"], name: "index_schedules_on_home_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_seasons_on_slug", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "facility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "season_id"
    t.integer "league_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["season_id"], name: "index_teams_on_season_id"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  add_foreign_key "matches", "away_teams"
  add_foreign_key "matches", "home_teams"
  add_foreign_key "matches", "schedules"
  add_foreign_key "schedules", "away_teams"
  add_foreign_key "schedules", "home_teams"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "seasons"
end
