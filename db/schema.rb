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

ActiveRecord::Schema.define(version: 20170311205556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "song_lyric_verse_references", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "song_lyric_id"
    t.integer  "start_book"
    t.integer  "start_chapter"
    t.integer  "start_verse"
    t.integer  "end_book"
    t.integer  "end_chapter"
    t.integer  "end_verse"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "song_section_id"
  end

  add_index "song_lyric_verse_references", ["song_id"], name: "index_song_lyric_verse_references_on_song_id", using: :btree
  add_index "song_lyric_verse_references", ["song_lyric_id"], name: "index_song_lyric_verse_references_on_song_lyric_id", using: :btree

  create_table "song_lyrics", force: :cascade do |t|
    t.integer  "song_id"
    t.text     "line"
    t.integer  "sort_order"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "song_section_id"
  end

  add_index "song_lyrics", ["song_id"], name: "index_song_lyrics_on_song_id", using: :btree

  create_table "song_sections", force: :cascade do |t|
    t.integer  "song_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "song_sections", ["song_id"], name: "index_song_sections_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.text     "artist"
    t.text     "video_url"
    t.integer  "bpm"
    t.string   "time_signature"
    t.integer  "release_year"
    t.integer  "rating"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "hidden",         default: false
  end

  add_foreign_key "song_lyric_verse_references", "song_lyrics"
  add_foreign_key "song_lyric_verse_references", "songs"
  add_foreign_key "song_lyrics", "songs"
  add_foreign_key "song_sections", "songs"
end
