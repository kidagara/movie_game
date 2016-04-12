class MoviesController < ApplicationController
  before_filter :find_movie

  def index
    @movies = Movie.order(:release_date)
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
    i = Imdb::Movie.new("#{@movie.movie_name}")
    if @movie.save
      @movie.movie_description = i.title
      @movie.release_date = i.release_date
      @movie.movie_plot = i.plot_summary
      @movie.movie_rating = i.mpaa_rating
      @movie.imdb_url = i.trailer_url
      @movie.save!
      redirect_to movies_path, notice: %Q[Saved "#{@movie.movie_name}" successfully.]
    else
      render :new
    end
  end

  def update
    if @movie.update_attributes(movie_params)
      i = Imdb::Movie.new("#{@movie.movie_name}")
      @movie.movie_description = i.title
      @movie.release_date = i.release_date
      @movie.movie_plot = i.plot_summary
      @movie.movie_rating = i.mpaa_rating
      @movie.imdb_url = i.trailer_url
      @movie.save!
      redirect_to movie_path(@movie), notice: %Q[Updated "#{@movie.movie_name}" successfully.]
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
    params.require(:movie).permit(:movie_name, :movie_poster, :movie_description, :release_date, :imdb_url, :boxoffice_earnings, :movie_plot, :movie_rating)
  end
end
