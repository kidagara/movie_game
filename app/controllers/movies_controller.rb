class MoviesController < ApplicationController
  before_filter :find_movie

  def index
    @movies = Movie.all
  end

  def list
    @movie_info = MovieInfo.new('http://www.boxofficemojo.com/data/js/moviegross.php?id=starwars3.htm&shortgross=0')
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: %Q[Saved "#{@movie.title}" successfully.]
    else
      render :new
    end
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie), notice: %Q[Updated "#{@movie.title}" successfully.]
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id]) if params[:id]
  end

  def movie_params
    params.require(:movie).permit(:title, :artwork, :released_on, :imdb_link, :box_office_earnings)
  end
end
