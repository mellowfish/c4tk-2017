class Song < ActiveRecord::Base
  has_many :sections, class_name: "SongSection", dependent: :destroy
  has_many :lyrics, class_name: "SongLyric"
  has_many :general_verse_references, class_name: "SongLyricVerseReference", dependent: :destroy
  has_many :section_verse_references, through: :sections, class_name: "SongLyricVerseReference"
  has_many :lyric_verse_references, through: :lyrics, class_name: "SongLyricVerseReference"

  validates :title, :artist, presence: true

  attr_accessor :raw_lyrics

  def self.from_search(search_text)
    like_match = "%#{search_text}%"
    Song
      .distinct
      .joins(:lyrics)
      .where("title LIKE ? OR artist LIKE ? OR line LIKE ?", like_match, like_match, like_match)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def rating
    super.to_i
  end

  def star_rating
    StarRating.new(rating)
  end

  def tempo
    "#{bpm} Beats per Minute"
  end
end
