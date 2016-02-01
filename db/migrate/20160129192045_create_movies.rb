class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title, index: true
      t.string :artwork
      t.date :released_on
      t.string :imdb_link
      t.integer :box_office_earnings

      t.timestamps null: false
    end

		def down
			drop_table :movies
		end
  end
end
