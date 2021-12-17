class RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def ratings_create
    
    binding.pry
    
    # user_manager = current_user.sale_user_managers.find_by(manager_id: params[:manager_id])
    # params[:sale_manager] == "add" ? user_manager.confirm! : user_manager.delete
    # render json: {success: true}
  end 
end