class SongLyric < ActiveRecord::Base
  belongs_to :song
  has_many :verse_references, class_name: "SongLyricVerseReference"
end
