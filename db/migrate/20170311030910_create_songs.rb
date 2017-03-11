class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :artist
      t.text :video_url
      t.integer :bpm
      t.string :time_signature
      t.integer :release_year
      t.integer :rating

      t.timestamps null: false
    end
  end
end
