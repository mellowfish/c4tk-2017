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
end