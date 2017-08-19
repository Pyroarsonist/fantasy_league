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

ActiveRecord::Schema.define(version: 20170819103621) do

  create_table "gamers", force: :cascade do |t|
    t.string "name"
    t.string "name_id"
    t.string "team"
    t.string "team_id"
    t.string "match_all"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "site"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_matches", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "name_id"
    t.string "team"
    t.integer "team_id"
    t.integer "kills"
    t.integer "heads"
    t.integer "assists"
    t.integer "deaths"
    t.float "adr"
    t.float "fantasy_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
