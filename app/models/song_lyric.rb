class SongLyric < ActiveRecord::Base
  belongs_to :song
  belongs_to :section, class_name: "SongSection", foreign_key: :song_section_id
  has_many :verse_references, class_name: "SongLyricVerseReference", dependent: :destroy

  default_scope -> { order(:sort_order) }

  def self.import_from_raw_lyrics(song:, raw_lyrics:)
    ImportsRawLyrics.new(song: song, raw_lyrics: raw_lyrics).call
  end
end
