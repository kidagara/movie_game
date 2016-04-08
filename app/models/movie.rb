class Movie < ActiveRecord::Base

  validates :movie_name, presence: true
  validates :boxoffice_earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: Proc.new { |movie| movie.boxoffice_earnings.present? }

end
