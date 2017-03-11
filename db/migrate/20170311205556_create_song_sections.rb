class CreateSongSections < ActiveRecord::Migration
  def change
    create_table :song_sections do |t|
      t.references :song, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
