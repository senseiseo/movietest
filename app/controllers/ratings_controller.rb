class RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def ratings_create
    movie = Movie.find params[:movie_id]
      @rating = movie.ratings.build vote_params
  
      respond_to do |format|
        if @rating.save
          format.json { render json: {success: true, rating_sum: movie.ratings.average(:stars)}}
        else
          format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
      end
  end 

  private 

  def vote_params 
    params.permit(:stars, :movie_id).merge(user: current_user)
  end 

end