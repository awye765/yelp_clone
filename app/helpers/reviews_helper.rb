module ReviewsHelper
  def star_rating(rating)
    return rating unless rating.respond_to?(:round)  # => true
    remainder = (5 - rating.round)                   # => 1
    "★" * rating.round + "☆" * remainder             # => "★★★★☆"
  end                                                # => :star_rating
end                                                  # => :star_rating
