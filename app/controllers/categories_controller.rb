class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]

  def show 
    @movie = @category.movies.decorate
  end 

  # def edit 
  # end 

  # def update 
  #   if @category.update category_params 
  #     flash[:success] = "Category updated"
  #     redirect_to categories_path
  #   else
  #     render :edit
  #   end 
  # end 

  def index 
    @categories = Category.all
  end 

  def new 
    @category  = Category.new
  end 

  def create 
    @category = Category.new category_params
    if @category.save 
      flash[:success] = "Category created"
      redirect_to categories_path
    else
      render :new
    end 
  end 

  def destroy
    @category.destroy
    flash[:success] = "category deleted"
    redirect_to root_path
  end 

  private 

  def find_category
    @category = Category.find params[:id]
  end 

  def category_params 
    params.require(:category).permit(:name)
  end
end 
