class MoviesController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :authorize_movie!
  after_action :verify_authorized

  def index
      @pagy, @movies = pagy Movie.order(created_at: :desc)
      @movies = @movies.decorate
  end 

  def show 
    @movie = @movie.decorate
  end 

  def edit 
  end 

  def update
    if @movie.update movie_params
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
    @movie = Movie.new(movie_params)
    if @movie.save        
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
    params.require(:movie).permit(:title, :body, category_ids: []).merge(user: current_user)
  end

  def authorize_movie!
    authorize(@movie || Movie)
  end 
end 
