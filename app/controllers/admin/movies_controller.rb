module Admin
  class MoviesController < BaseController
    before_action :require_authentication #, only: %i[edit update]
    before_action :set_movie! , only: %i[show edit update destroy]
    before_action :authorize_movie!
    after_action :verify_authorized

    def show 
    end 

    def index 
      @pagy, @movies = pagy Movie.order(created_at: :desc)
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
      params.require(:movie).permit(:title, :body, category_ids: []).merge(user: current_user)
    end 

    def authorize_movie!
      authorize(@movie || Movie)
    end
  end
end