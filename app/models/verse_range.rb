class VerseRange
  def self.parse(verse_range_str)
    if /
        (?<book_name>(?:\d\s+)?[[:alpha:]]+)
        \s*
        (?<start_chapter>\d+)\s*
        :\s*
        (?<start_verse>\d+)
        (?:
          \s*-\s*
          (?:
            (?<end_chapter>\d+)
            \s*:\s*
          )?
          (?<end_verse>\d+)
        )?
      /x =~ verse_range_str
      start_verse_ref = VerseReference.new(book_name, start_chapter, start_verse)
      end_verse_ref =
        if end_verse.present?
          if end_chapter.present?
            VerseReference.new(book_name, end_chapter, end_verse)
          else
            VerseReference.new(book_name, start_chapter, end_verse)
          end
        else
          start_verse_ref
        end
      new(start_verse_ref, end_verse_ref)
    else
      raise verse_range_str
    end
  end

  attr_reader :start_verse_ref, :end_verse_ref
  def initialize(start_verse_ref, end_verse_ref=start_verse_ref)
    @start_verse_ref = start_verse_ref
    @end_verse_ref = end_verse_ref
  end

  delegate :book, :book_name, :chapter, :verse, to: :start_verse_ref, prefix: :start
  delegate :book, :book_name, :chapter, :verse, to: :end_verse_ref, prefix: :end

  delegate :old_testament?, :new_testament?, to: :start_verse_ref

  def to_s
    if start_book == end_book
      if start_chapter == end_chapter
        if start_verse == end_verse
          start_verse_ref.to_s
        else
          "#{start_verse_ref}-#{end_verse}"
        end
      else
        "#{start_verse_ref}-#{end_chapter}:#{end_chapter}"
      end
    else
      "#{start_verse_ref} - #{end_verse_reference}"
    end
  end

  def single_book?
    start_book == end_book
  end

  def single_chapter?
    single_book? && start_chapter == end_chapter
  end

  def single_verse?
    single_chapter? && start_verse == end_verse
  end
end