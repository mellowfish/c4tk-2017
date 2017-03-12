class Bible
  BOOKS = %w(
    Unknown
    Genesis Exodus Leviticus
    Numbers Deuteronomy
    Joshua Judges Ruth
    1\ Samuel 2\ Samuel
    1\ Kings 2\ Kings
    1\ Chronicles 2\ Chronicles
    Ezra Nehemiah
    Esther Job
    Psalms Proverbs
    Ecclesiastes Song\ of\ Solomon
    Isaiah Jeremiah Lamentations Ezekiel
    Daniel Hosea Joel Amos Obadiah
    Jonah Micah Nahum
    Habakkuk Zephaniah
    Haggai Zechariah
    Malachi

    Matthew Mark Luke John
    Acts Romans
    1\ Corinthians 2\ Corinthians
    Galatians Ephesians
    Philippians Colossians
    1\ Thessalonians 2\ Thessalonians
    1\ Timothy 2\ Timothy
    Titus Philemon
    Hebrews James
    1\ Peter 2\ Peter
    1\ John 2\ John 3\ John
    Jude Revelation
  )

  def self.book_name(book_number)
    return nil if book_number.blank?

    BOOKS[book_number]
  end

  def self.book_number(book_name)
    return -1 if book_name.blank?
    BOOKS.index(book_name.capitalize)
  end

  def self.parse_bcv(verse_ref_str)
    *book_parts, chapter_verse = verse_ref_str.split(" ")
    ref_book_name = book_parts.join(" ")
    ref_chapter, ref_verse = chapter_verse.split(":")

    [book_number(ref_book_name), ref_chapter.to_i, ref_verse.to_i]
  end
end