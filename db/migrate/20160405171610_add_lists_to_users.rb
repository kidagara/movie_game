class AddListsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :movie_one, :string
		add_column :users, :movie_two, :string
		add_column :users, :movie_three, :string
		add_column :users, :movie_four, :string
		add_column :users, :movie_five, :string
		add_column :users, :movie_six, :string
		add_column :users, :movie_seven, :string
		add_column :users, :movie_eight, :string
		add_column :users, :movie_nine, :string
		add_column :users, :movie_ten, :string
		add_column :users, :movie_darkhorse_one, :string
		add_column :users, :movie_darkhorse_two, :string
		add_column :users, :movie_darkhorse_three, :string
		add_column :users, :movie_one_points, :integer
		add_column :users, :movie_two_points, :integer
		add_column :users, :movie_three_points, :integer
		add_column :users, :movie_four_points, :integer
		add_column :users, :movie_five_points, :integer
		add_column :users, :movie_six_points, :integer
		add_column :users, :movie_seven_points, :integer
		add_column :users, :movie_eight_points, :integer
		add_column :users, :movie_nine_points, :integer
		add_column :users, :movie_ten_points, :integer
		add_column :users, :movie_darkhorse_one_points, :integer
		add_column :users, :movie_darkhorse_two_points, :integer
		add_column :users, :movie_darkhorse_three_points, :integer
	end
end

