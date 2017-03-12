module DBP
  class Volume
    include HTTParty
    base_uri "dbt.io"

    DAM_IDS = {
      esv: {
        base: "ENGESV",
        nt: "ENGESVN2ET",
        ot: "ENGESVO2ET"
      }
    }

    def self.dam_id_for_verse_range_in_abbr(abbr, verse_range)
      dam_data = DAM_IDS[abbr.intern] || DAM_IDS[:esv]

      if dam_data.key?(:full)
        dam_data[:full]
      elsif verse_range.old_testament?
        dam_data[:ot]
      else
        dam_data[:nt]
      end
    end

    def self.find_by_dam_id(dam_id)
      get("/library/book", DBP.standard_query_params.merge(dam_id: dam_id))
    end
  end
end