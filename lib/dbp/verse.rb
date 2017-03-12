module DBP
  class Verse
    include HTTParty
    base_uri "dbt.io"

    def self.text_for_range(verse_range, translation: :esv)
      return "Sorry, we can't lookup more than one chapter at a time." unless verse_range.single_chapter?
      get(
        "text/verse",
        DBP.standard_query_params.merge(
          book_name: verse_range.book_name,
          chapter_id: verse_range.start_chapter,
          verse_start: verse_range.start_verse,
          verse_end: verse_range.end_verse,
          dam_id: Volume.dam_id_for_verse_range_in_abbr(translation, verse_range)
        )
      )
    end
  end
end