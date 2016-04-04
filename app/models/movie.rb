class Movie < ActiveRecord::Base
  mount_uploader :movie_poster, MoviePosterUploader

  validate :released_during_summer

  validates :movie_name, presence: true
  validates :release_date, presence: true
  validates :imdb_url, format: { with: URI.regexp, message: "must be a valid URL" }, if: Proc.new { |movie| movie.imdb_url.present? }
  validates :boxoffice_earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: Proc.new { |movie| movie.boxoffice_earnings.present? }

  def released_during_summer
    start_date = Date.parse("2016-05-01")
    end_date   = Date.parse("2016-08-31")
    unless (start_date..end_date).cover? release_date
      errors.add(:release_date, "must be between May 1 and August 31")
    end
  end
end
