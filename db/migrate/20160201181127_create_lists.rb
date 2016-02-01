class CreateLists < ActiveRecord::Migration
  def up
    create_table :lists do |t|
      t.string :title, index: true
      t.string :imdb_link
      t.integer :box_office_earnings

      t.timestamps null: false
    end

		def down
			drop_table :lists
		end
  end
end
