class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show]

  def show 
    @pagy, @movies = pagy @category.movies.order(created_at: :desc)
    @movies = @movies.decorate  
  end 

  
  def index 
    @categories = Category.all
  end 


  private 

  def find_category
    @category = Category.find params[:id]
  end 

  def category_params 
    params.require(:category).permit(:name)
  end
end 
