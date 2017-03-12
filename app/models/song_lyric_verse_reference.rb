class SongLyricVerseReference < ActiveRecord::Base
  belongs_to :song
  belongs_to :section, foreign_key: :song_section_id
  belongs_to :lyric, foreign_key: :song_lyric_id

  def start_book_name
    Bible.book_name(start_book)
  end

  def start_book_name=(book_name)
    self.start_book = Bible.book_number(book_name)
  end

  def start_verse_reference
    return nil unless start_book.present?

    "#{start_book_name} #{start_chapter}:#{start_verse}"
  end

  def start_verse_reference=(verse_reference_str)
    b, c, v = *Bible.parse_bcv(verse_reference_str)
    self.start_book = b
    self.start_chapter = c
    self.start_verse = v
  end

  def end_book_name
    Bible.book_name(end_book)
  end

  def end_book_name=(book_name)
    self.end_book = Bible.book_number(book_name)
  end

  def end_verse_reference
    return nil unless end_book.present?

    "#{end_book_name} #{end_chapter}:#{end_verse}"
  end

  def end_verse_reference=(verse_reference_str)
    b, c, v = *Bible.parse_bcv(verse_reference_str)
    self.end_book = b
    self.end_chapter = c
    self.end_verse = v
  end

  def to_s
    if start_book == end_book
      if start_chapter == end_chapter
        if start_verse == end_verse
          start_verse_reference
        else
          "#{start_verse_reference}-#{end_verse}"
        end
      else
        "#{start_verse_reference}-#{end_chapter}:#{end_chapter}"
      end
    else
      "#{start_verse_reference} - #{end_verse_reference}"
    end

  end
end
