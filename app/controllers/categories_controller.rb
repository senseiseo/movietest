class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show]

  def show 
    @movie = @category.movies.decorate
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
