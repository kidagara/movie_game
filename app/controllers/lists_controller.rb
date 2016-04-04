class ListsController < ApplicationController
  before_action :find_list

  def index
    lists
    all_lists
  end

  def new
    @list = List.new
    @list.user_id = current_user.id
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id if current_user
    if @list.save
      redirect_to lists_path, notice: %(Updated #{@current_user}'s list successfully.)
    else
      render :new
    end
  end

  def update
    if list.update(list_params)
      redirect_to lists_path, notice: %(Updated #{@current_user}'s list successfully.)
    else
      render :edit
    end
  end

  def destroy
    list.destroy
    redirect_to lists_path
  end

  private

  def lists
    @lists ||= current_user.lists
  end

  def all_lists
    if current_user.has_role?(:admin)
      @all_lists = List.all
      # but listed in order by user_id user last name
    else
      @all_lists ||= nil
    end
  end

  def list
    @list ||= current_user.lists.find(params[:id])
  end

  def find_list
    @list = List.find(params[:id]) if params[:id]
  end

  def list_params
    params.require(:list).permit(:user_id, :movie_one, :movie_two, :movie_three, :movie_four, :movie_five, :movie_six, :movie_seven, :movie_eight, :movie_nine, :movie_ten, :movie_darkhorse_one, :movie_darkhorse_two, :movie_darkhorse_three, :movie_one_points, :movie_two_points, :movie_three_points, :movie_four_points, :movie_five_points, :movie_six_points, :movie_seven_points, :movie_eight_points, :movie_nine_points, :movie_ten_points, :movie_darkhorse_one_points, :movie_darkhorse_two_points, :movie_darkhorse_three_points)
  end

end
