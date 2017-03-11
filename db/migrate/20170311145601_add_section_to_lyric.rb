class AddSectionToLyric < ActiveRecord::Migration
  def change
    add_reference :song_lyrics, :song_section
    add_reference :song_lyric_verse_references, :song_section
  end
end