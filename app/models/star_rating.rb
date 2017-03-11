class StarRating
  attr_reader :rating
  def initialize(rating)
    @rating = rating
  end

  def to_s
    "\u2B50" * rating + "\u26AA" * (5 - rating)
  end
end