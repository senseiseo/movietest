class Admin::CategoriesController < ApplicationController
  before_action :requiere_authentication #, only: %i[edit update]
  before_action :set_movie! , only: %i[show edit update destroy]

  def show 
  end 

  def index 
    @pagy, @movies = pagy Movie.order(created_at: :desc)
  end 

  def new 
    @movie = Movie.new
  end 

  def create
    @movie = Movie.create(title: movie_params[:title], body: movie_params[:body])
    if @movie.save    
      if add_category.present?
        add_category.each do |category_id| 
          Position.create(movie_id: @movie.id, category_id: category_id)
        end
      end
      flash[:success] = "Movie created"
      redirect_to admin_movies_path
    else
        render :new
    end
  end 

  def edit 
  end 
  
  def update
    if @movie.update title: movie_params[:title], body: movie_params[:body]
      if category.present?
        add_category.each do |category_id| 
          Position.create(movie_id: @movie.id , category_id: category_id)
        end
      end
      flash[:success] = "Movie updated"
      redirect_to admin_movies_path
    else
      render :edit
    end 
  end  

  def destroy
    @movie.destroy
    flash[:success] = "Movie deleted"
    redirect_to admin_movies_path
  end

  private 

  def set_movie!
    @movie = Movie.find params[:id]
  end 
  
  def movie_params
    params.require(:movie).permit(:title, :body, category: [])
  end 

  def add_category
    category = movie_params[:category]
    category.delete_at(0)
    category_ids = @movie.categories.map { |movie| movie.id}
    category = category - category_ids
  end 
end 