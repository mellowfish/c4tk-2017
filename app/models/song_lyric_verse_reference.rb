class SongLyricVerseReference < ActiveRecord::Base
  belongs_to :song
  belongs_to :song_lyric
end
