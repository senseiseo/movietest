class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]

  def show 
  end 

  def edit 
  end 

  def update
    category = movie_params[:category]
    category.delete_at(0)
    category_ids = @movie.categories.map { |movie| movie.id}
    category = category - category_ids
    if @movie.update title: movie_params[:title], body: movie_params[:body],stars:movie_params[:stars]
      if category.present?
        category.each do |category_id| 
          Position.create(movie_id: @movie.id , category_id: category_id)
        end
      end
      flash[:success] = "Movie updated"
      redirect_to movie_path
    else
      render :edit
    end 
  end 

  def index
    @all_movies = Movie.all 
    @movies = Movie.all
  end 

  def new 
    @movie = Movie.new
  end 

  def create
    category = movie_params[:category]
    category.delete_at(0)
    @movie = Movie.create(title: movie_params[:title], body: movie_params[:body], stars:movie_params[:stars])
    if @movie.save    
      if category.present?
        category.each do |category_id| 
          Position.create(movie_id: @movie.id, category_id: category_id)
        end
      end
      flash[:success] = "Movie created"
      redirect_to root_path
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
    params.require(:movie).permit(:title, :body, :stars, category: [])
  end
end 
