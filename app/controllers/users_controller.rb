class UsersController < ApplicationController
  before_action :find_user
  after_action :verify_authorized

  def index
    @users = User.order("last_name, first_name ASC").all
    authorize :user
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: %(Updated "#{@user.name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: %(Deleted "#{@user.name}" successfully.)
  end

private

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :movie_one, :movie_two, :movie_three, :movie_four, :movie_five, :movie_six, :movie_seven, :movie_eight, :movie_nine, :movie_ten, :movie_darkhorse_one, :movie_darkhorse_two, :movie_darkhorse_three, :movie_one_points, :movie_two_points, :movie_three_points, :movie_four_points, :movie_five_points, :movie_six_points, :movie_seven_points, :movie_eight_points, :movie_nine_points, :movie_ten_points, :movie_darkhorse_one_points, :movie_darkhorse_two_points, :movie_darkhorse_three_points)
  end

end
