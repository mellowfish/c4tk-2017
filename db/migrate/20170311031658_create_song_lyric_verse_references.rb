class CreateSongLyricVerseReferences < ActiveRecord::Migration
  def change
    create_table :song_lyric_verse_references do |t|
      t.references :song, index: true, foreign_key: true
      t.references :song_lyric, index: true, foreign_key: true

      t.integer :start_book
      t.integer :start_chapter
      t.integer :start_verse

      t.integer :end_book
      t.integer :end_chapter
      t.integer :end_verse

      t.timestamps null: false
    end
  end
end
