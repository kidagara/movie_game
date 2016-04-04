class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :movie_one
      t.string :movie_two
      t.string :movie_three
      t.string :movie_four
      t.string :movie_five
      t.string :movie_six
      t.string :movie_seven
      t.string :movie_eight
      t.string :movie_nine
      t.string :movie_ten
      t.string :movie_darkhorse_one
      t.string :movie_darkhorse_two
      t.string :movie_darkhorse_three
      t.integer :movie_one_points
      t.integer :movie_two_points
      t.integer :movie_three_points
      t.integer :movie_four_points
      t.integer :movie_five_points
      t.integer :movie_six_points
      t.integer :movie_seven_points
      t.integer :movie_eight_points
      t.integer :movie_nine_points
      t.integer :movie_ten_points
      t.integer :movie_darkhorse_one_points
      t.integer :movie_darkhorse_two_points
      t.integer :movie_darkhorse_three_points
      t.timestamps
    end
  end
end
