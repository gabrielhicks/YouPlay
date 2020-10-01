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

ActiveRecord::Schema.define(version: 2020_10_01_135643) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["video_id"], name: "index_likes_on_video_id"
  end

  create_table "playlist_videos", force: :cascade do |t|
    t.integer "video_id", null: false
    t.integer "playlist_id", null: false
    t.index ["playlist_id"], name: "index_playlist_videos_on_playlist_id"
    t.index ["video_id"], name: "index_playlist_videos_on_video_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "video_id"
    t.string "title"
    t.string "thumbnail_url"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "views", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_views_on_user_id"
    t.index ["video_id"], name: "index_views_on_video_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "videos"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "videos"
  add_foreign_key "playlist_videos", "playlists"
  add_foreign_key "playlist_videos", "videos"
  add_foreign_key "playlists", "users"
  add_foreign_key "views", "users"
  add_foreign_key "views", "videos"
end
