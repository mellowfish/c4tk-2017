class Song < ActiveRecord::Base
  has_many :lyrics, class_name: "SongLyric"
  has_many :verse_references, through: :lyrics, class_name: "SongLyricVerseReference"

  validates :title, :artist, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def rating
    super.to_i
  end

  def star_rating
     "\u2B50" * rating + "\u26AA" * (5 - rating)
  end

  def tempo
    "#{bpm} Beats per Minute"
  end
end
