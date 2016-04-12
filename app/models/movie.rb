class Movie < ActiveRecord::Base

  validates :movie_name, presence: true
  validates :boxoffice_earnings, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: Proc.new { |movie| movie.boxoffice_earnings.present? }

  def movie_one_add
  	movie = Movie.find(params[:id])
  	user = User.find(params[:id])
  	user.update_attribute(:movie_one, movie.movie_description)
  end

end
