class VerseReference
  attr_reader :book, :chapter, :verse
  def initialize(book, chapter, verse)
    @book = Bible.book_number(book) rescue book.to_i
    @chapter = chapter
    @verse = verse
  end

  def book_name
    Bible.book_name(book)
  end

  def to_s
    "#{book_name} #{chapter}:#{verse}"
  end

  def old_testament?
    book < 40
  end

  def new_testament?
    book >= 40
  end
end