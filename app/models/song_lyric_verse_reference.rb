class SongLyricVerseReference < ActiveRecord::Base
  belongs_to :song
  belongs_to :section, foreign_key: :song_section_id
  belongs_to :lyric, foreign_key: :song_lyric_id
end
