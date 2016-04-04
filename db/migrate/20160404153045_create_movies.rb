class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_name, index: true
      t.string :movie_poster
      t.string :imdb_url
      t.date :release_date
      t.text :movie_description
      t.integer :boxoffice_earnings, :default => 0
      t.timestamps
    end
  end
end
