class AddMoviePlotToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :movie_plot, :string
  end
end
