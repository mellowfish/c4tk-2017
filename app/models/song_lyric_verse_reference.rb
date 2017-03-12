class SongLyricVerseReference < ActiveRecord::Base
  belongs_to :song
  belongs_to :section, foreign_key: :song_section_id
  belongs_to :lyric, foreign_key: :song_lyric_id

  def self.contains_verse_where_fragment(verse_reference)
    <<-SQL
(
  (
    start_book < #{verse_reference.book} OR
    (
      start_book = #{verse_reference.book} AND
      (
        start_chapter < #{verse_reference.chapter} OR
        (
          start_chapter = #{verse_reference.chapter} AND start_verse <= #{verse_reference.verse}
        )
      )
    )
  ) AND
  (
    end_book > #{verse_reference.book} OR
    (
      end_book = #{verse_reference.book} AND
      (
        end_chapter > #{verse_reference.chapter} OR
        (
          end_chapter = #{verse_reference.chapter} AND end_verse >= #{verse_reference.verse}
        )
      )
    )
  )
)
    SQL
  end

  scope :contains_verse, ->(verse_reference) { where(contains_verse_where_fragment(verse_reference)) }
  scope :intersects_range, ->(verse_range) {
    where("#{contains_verse_where_fragment(verse_range.start_verse_ref)} OR #{contains_verse_where_fragment(verse_range.end_verse_ref)}")
  }
  scope :contains_range, ->(verse_range) {
    where("#{contains_verse_where_fragment(verse_range.start_verse_ref)} AND #{contains_verse_where_fragment(verse_range.end_verse_ref)}")
  }

  def self.import_raw_general_references(song:, general_references:)
    general_references
      .split(/[,;]\w?/)
      .each do |verse_range_str|
      create!(song: song, verse_range_str: verse_range_str)
    end
  end

  def start_verse_reference
    VerseReference.new(start_book, start_chapter, start_verse) if start_book
  end

  def start_verse_reference=(verse_reference)
    self.start_book = verse_reference.book
    self.start_chapter = verse_reference.chapter
    self.start_verse = verse_reference.verse
  end

  def end_verse_reference
    VerseReference.new(end_book, end_chapter, end_verse) if end_book
  end

  def end_verse_reference=(verse_reference)
    self.end_book = verse_reference.book
    self.end_chapter = verse_reference.chapter
    self.end_verse = verse_reference.verse
  end

  def verse_range_str=(verse_ref_str)
    self.verse_range = VerseRange.parse(verse_ref_str)
  end

  def verse_range_str
    self.verse_range.to_s
  end
  alias_method :to_s, :verse_range_str

  def verse_range=(verse_range)
    self.start_verse_reference = verse_range.start_verse_ref
    self.end_verse_reference = verse_range.end_verse_ref
  end

  def verse_range
    VerseRange.new(start_verse_reference, end_verse_reference) if start_verse_reference
  end

  def verse_text
    DBP::Verse.text_for_range(verse_range) if start_verse_reference && verse_range.single_chapter?
  end

  def to_h
    {
      verse_reference: verse_range_str,
      verse_text: verse_text.to_s
    }
  end
end
