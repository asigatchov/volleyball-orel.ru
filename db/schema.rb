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

ActiveRecord::Schema.define(version: 20171125195946) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.integer  "parent_id",                default: 0
    t.integer  "pos"
    t.boolean  "active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start_at"
    t.string   "place_name"
    t.integer  "team_a"
    t.integer  "team_b"
    t.integer  "member_a"
    t.integer  "member_b"
    t.integer  "score_a"
    t.integer  "score_b"
    t.string   "full_score"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "rescheduled",   default: false
    t.integer  "tournament_id", default: 0
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.date     "birthday"
    t.integer  "pos"
    t.boolean  "active"
    t.integer  "team_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "desc",       limit: 65535
    t.integer  "pos"
    t.boolean  "active"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "gender",     limit: 5,     default: "man"
  end

  create_table "teams_tournaments", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "team_id"
    t.integer "tournament_id"
    t.index ["team_id"], name: "index_teams_tournaments_on_team_id", using: :btree
    t.index ["tournament_id"], name: "index_teams_tournaments_on_tournament_id", using: :btree
  end

  create_table "tournaments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "desc",       limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "pos"
    t.boolean  "active"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "admin"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "desc",          limit: 65535
    t.string   "youtube_id"
    t.string   "image"
    t.integer  "tournament_id"
    t.integer  "team_a"
    t.integer  "team_b"
    t.integer  "pos"
    t.boolean  "active"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
