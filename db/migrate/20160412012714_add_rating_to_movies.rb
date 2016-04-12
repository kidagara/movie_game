class AddRatingToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :movie_rating, :string
  end
end
