class MoviesController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :authorize_movie!
  after_action :verify_authorized

  def index
    if params.has_key?(:category)  
      @category = Category.find_by_name(params[:category])
      @pagy, @movies = pagy @category.movies
      @movies = @movies.decorate
    else
      @pagy, @movies = pagy Movie.order(created_at: :desc)
      @movies = @movies.decorate
      @category = Category.all 
    end 
  end 

  def show 
    @movie = @movie.decorate
  end 

  def edit 
  end 

  def update
    if @movie.update title: movie_params[:title], body: movie_params[:body]
      if add_category.present?
        add_category.each do |category_id| 
          Position.create(movie_id: @movie.id , category_id: category_id)
        end
      end
      flash[:success] = "Movie updated"
      redirect_to movie_path
    else
      render :edit
    end 
  end 

  def new 
    @movie = Movie.new
  end 

  def create
    
    binding.pry
    
    @movie = Movie.create title: movie_params[:title], body: movie_params[:body], user_id: movie_params[:user][:id]
    if @movie.save    
      if add_category.present?
        add_category.each do |category_id| 
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
    params.require(:movie).permit(:title, :body, category: []).merge(user: current_user)
  end

  def add_category
    category = movie_params[:category]
    category.delete_at(0)
    category_ids = @movie.categories.map { |movie| movie.id}
    category = category - category_ids
  end 

  def authorize_movie!
    authorize(@movie || Movie)
  end 

end 
