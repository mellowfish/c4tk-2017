module DBP
  class Verse < OpenStruct
    include HTTParty
    base_uri "dbt.io"

    def self.verse_data_for_range(verse_range, translation = :esv)
      return [] unless verse_range.single_chapter?
      raw_response =
        get(
          "/text/verse",
          query:
            DBP.standard_query_params.merge(
              book_id: DBP.book_abbr_from_number(verse_range.start_book),
              chapter_id: verse_range.start_chapter,
              verse_start: verse_range.start_verse,
              verse_end: verse_range.end_verse,
              dam_id: Volume.dam_id_for_verse_range_in_abbr(translation, verse_range)
            )
        )
      # raise raw_response.request.last_uri.to_s
      response_json = JSON.parse(raw_response.body)
      Array(response_json).map { |verse_data| new(verse_data) }
    end

    def self.text_for_range(verse_range, translation = :esv)
      return "Sorry, we can't lookup more than one chapter at a time." unless verse_range.single_chapter?
      verse_data_for_range(verse_range, translation).map(&:verse_text).join
    end
  end
end