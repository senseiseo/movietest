class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :find_movie_category

  def show 
  end 

  def edit 
  end 

  def update 
    if @movie.update movie_params 
      flash[:success] = "Movie updated"
      redirect_to category_movie_path
    else
      render :edit
    end 
  end 

  def index 
    @movies = Movie.all
  end 

  def new 
    @movie = Movie.new
  end 

  def create
    movie = @category.movies.build movie_params 
    if movie.save 
      flash[:success] = "Movie created"
      redirect_to category_path(@category)
    else
      render :new
    end 
  end 

  def destroy
    @movie.destroy
    flash[:success] = "Movie deleted"
    redirect_to root_path
  end 

  private 

  def find_movie
    @movie = Movie.find params[:id]
  end 

  def movie_params 
    params.require(:movie).permit(:title, :body)
  end

  def find_movie_category
    @category = Category.find params[:category_id]
  end
end 
