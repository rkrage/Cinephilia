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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120403165444) do

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "watch_list"
    t.boolean  "like_list"
  end

  add_index "likes", ["movie_id"], :name => "index_likes_on_imdbid"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "movies", :force => true do |t|
    t.string   "imdbid"
    t.string   "title"
    t.string   "genre1"
    t.string   "genre2"
    t.string   "rating"
    t.integer  "year"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "url"
    t.string   "poster"
    t.string   "plot"
    t.string   "user_rating"
  end

  create_table "mustsees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mustsees", ["user_id", "movie_id"], :name => "index_mustsees_on_user_id_and_movie_id", :unique => true

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
  end

end
