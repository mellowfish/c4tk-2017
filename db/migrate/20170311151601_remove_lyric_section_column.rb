class RemoveLyricSectionColumn < ActiveRecord::Migration
  def change
    remove_column :song_lyrics, :section
  end
end