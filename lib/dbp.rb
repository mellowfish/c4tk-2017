module DBP
  def self.api_key
    ENV["DBP_API_KEY"]
  end

  def self.standard_query_params
    {
      v: 2,
      key: api_key
    }
  end

  BOOK_ORDER_DATA = [
    {
      "book_order": "0",
      "book_id": "Int",
      "book_name": "Intro"
    },
    {
      "book_order": "1",
      "book_id": "Gen",
      "book_name": "Genesis",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "2",
      "book_id": "Exod",
      "book_name": "Exodus",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "3",
      "book_id": "Lev",
      "book_name": "Leviticus",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "4",
      "book_id": "Num",
      "book_name": "Numbers",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "5",
      "book_id": "Deut",
      "book_name": "Deuteronomy",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "6",
      "book_id": "Josh",
      "book_name": "Joshua",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "7",
      "book_id": "Judg",
      "book_name": "Judges",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "8",
      "book_id": "Ruth",
      "book_name": "Ruth",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "9",
      "book_id": "1Sam",
      "book_name": "1 Samuel",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "10",
      "book_id": "2Sam",
      "book_name": "2 Samuel",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "11",
      "book_id": "1Kgs",
      "book_name": "1 Kings",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "12",
      "book_id": "2Kgs",
      "book_name": "2 Kings",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "13",
      "book_id": "1Chr",
      "book_name": "1 Chronicles",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "14",
      "book_id": "2Chr",
      "book_name": "2 Chronicles",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "15",
      "book_id": "Ezra",
      "book_name": "Ezra",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "16",
      "book_id": "Neh",
      "book_name": "Nehemiah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "17",
      "book_id": "Esth",
      "book_name": "Esther",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "18",
      "book_id": "Job",
      "book_name": "Job",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "19",
      "book_id": "Ps",
      "book_name": "Psalm",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "20",
      "book_id": "Prov",
      "book_name": "Proverbs",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "21",
      "book_id": "Eccl",
      "book_name": "Ecclesiastes",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "22",
      "book_id": "Song",
      "book_name": "Song of Solomon",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "23",
      "book_id": "Isa",
      "book_name": "Isaiah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "24",
      "book_id": "Jer",
      "book_name": "Jeremiah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "25",
      "book_id": "Lam",
      "book_name": "Lamentations",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "26",
      "book_id": "Ezek",
      "book_name": "Ezekiel",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "27",
      "book_id": "Dan",
      "book_name": "Daniel",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "28",
      "book_id": "Hos",
      "book_name": "Hosea",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "29",
      "book_id": "Joel",
      "book_name": "Joel",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "30",
      "book_id": "Amos",
      "book_name": "Amos",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "31",
      "book_id": "Obad",
      "book_name": "Obadiah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "32",
      "book_id": "Jonah",
      "book_name": "Jonah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "33",
      "book_id": "Mic",
      "book_name": "Micah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "34",
      "book_id": "Nah",
      "book_name": "Nahum",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "35",
      "book_id": "Hab",
      "book_name": "Habakkuk",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "36",
      "book_id": "Zeph",
      "book_name": "Zephaniah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "37",
      "book_id": "Hag",
      "book_name": "Haggai",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "38",
      "book_id": "Zech",
      "book_name": "Zechariah",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "39",
      "book_id": "Mal",
      "book_name": "Malachi",
      "dam_id_root": "ENGESVO"
    },
    {
      "book_order": "1",
      "book_id": "Matt",
      "book_name": "Matthew",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "2",
      "book_id": "Mark",
      "book_name": "Mark",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "3",
      "book_id": "Luke",
      "book_name": "Luke",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "4",
      "book_id": "John",
      "book_name": "John",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "5",
      "book_id": "Acts",
      "book_name": "Acts",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "6",
      "book_id": "Rom",
      "book_name": "Romans",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "7",
      "book_id": "1Cor",
      "book_name": "1 Corinthians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "8",
      "book_id": "2Cor",
      "book_name": "2 Corinthians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "9",
      "book_id": "Gal",
      "book_name": "Galatians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "10",
      "book_id": "Eph",
      "book_name": "Ephesians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "11",
      "book_id": "Phil",
      "book_name": "Philippians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "12",
      "book_id": "Col",
      "book_name": "Colossians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "13",
      "book_id": "1Thess",
      "book_name": "1 Thessalonians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "14",
      "book_id": "2Thess",
      "book_name": "2 Thessalonians",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "15",
      "book_id": "1Tim",
      "book_name": "1 Timothy",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "16",
      "book_id": "2Tim",
      "book_name": "2 Timothy",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "17",
      "book_id": "Titus",
      "book_name": "Titus",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "18",
      "book_id": "Phlm",
      "book_name": "Philemon",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "19",
      "book_id": "Heb",
      "book_name": "Hebrews",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "20",
      "book_id": "Jas",
      "book_name": "James",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "21",
      "book_id": "1Pet",
      "book_name": "1 Peter",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "22",
      "book_id": "2Pet",
      "book_name": "2 Peter",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "23",
      "book_id": "1John",
      "book_name": "1 John",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "24",
      "book_id": "2John",
      "book_name": "2 John",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "25",
      "book_id": "3John",
      "book_name": "3 John",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "26",
      "book_id": "Jude",
      "book_name": "Jude",
      "dam_id_root": "ENGESVN"
    },
    {
      "book_order": "27",
      "book_id": "Rev",
      "book_name": "Revelation",
      "dam_id_root": "ENGESVN"
    }
  ]

  def self.book_abbr_from_name(book_name)
    BOOK_ORDER_DATA.each do |book_data|
      if book_data["book_name"] == book_name
        return book_data["book_id"]
      end
    end
  end

  def self.book_abbr_from_number(book_number)
    BOOK_ORDER_DATA[book_number][:book_id]
  end
end