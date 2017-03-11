class CreateSongLyrics < ActiveRecord::Migration
  def change
    create_table :song_lyrics do |t|
      t.references :song, index: true, foreign_key: true
      t.text :line
      t.string :section
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
