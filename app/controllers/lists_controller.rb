class ListsController < ApplicationController
  before_filter :find_list

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: %Q[Saved "#{@list.title}" successfully.]
    else
      render :new
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to list_path(@list), notice: %Q[Updated "#{@list.title}" successfully.]
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def find_list
    @list = List.find(params[:id]) if params[:id]
  end

  def list_params
    params.require(:list).permit(:title, :imdb_link, :box_office_earnings)
  end
end
