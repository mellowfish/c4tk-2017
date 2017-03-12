class SongSection < ActiveRecord::Base
  belongs_to :song
  has_many :lyrics, class_name: "SongLyric", dependent: :destroy
  has_many :section_verse_references, -> { where(song_lyric_id: nil) }, class_name: "SongLyricVerseReference", dependent: :destroy
  has_many :lyric_verse_references, through: :lyrics, class_name: "SongLyricVerseReference"
end
