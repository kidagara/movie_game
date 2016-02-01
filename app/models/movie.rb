class Movie < ActiveRecord::Base

  validates :title, presence: true
  validates :released_on, presence: true
  validates :imdb_link, format: { with: URI.regexp, message: "must be a valid URL" }, if: Proc.new { |movie| movie.imdb_link.present? }
  validates :box_office_earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: Proc.new { |movie| movie.box_office_earnings.present? }

  def released_during_summer
    start_date = Date.parse("2015-05-01")
    end_date   = Date.parse("2015-08-31")
    unless (start_date..end_date).cover? released_on
      errors.add(:released_on, "must be between May 1 and August 31")
    end
  end
end
