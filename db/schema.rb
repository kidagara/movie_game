# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160405171610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "movie_name"
    t.string   "movie_poster"
    t.string   "imdb_url"
    t.date     "release_date"
    t.text     "movie_description"
    t.integer  "boxoffice_earnings", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["movie_name"], name: "index_movies_on_movie_name", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "movie_one"
    t.string   "movie_two"
    t.string   "movie_three"
    t.string   "movie_four"
    t.string   "movie_five"
    t.string   "movie_six"
    t.string   "movie_seven"
    t.string   "movie_eight"
    t.string   "movie_nine"
    t.string   "movie_ten"
    t.string   "movie_darkhorse_one"
    t.string   "movie_darkhorse_two"
    t.string   "movie_darkhorse_three"
    t.integer  "movie_one_points"
    t.integer  "movie_two_points"
    t.integer  "movie_three_points"
    t.integer  "movie_four_points"
    t.integer  "movie_five_points"
    t.integer  "movie_six_points"
    t.integer  "movie_seven_points"
    t.integer  "movie_eight_points"
    t.integer  "movie_nine_points"
    t.integer  "movie_ten_points"
    t.integer  "movie_darkhorse_one_points"
    t.integer  "movie_darkhorse_two_points"
    t.integer  "movie_darkhorse_three_points"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
