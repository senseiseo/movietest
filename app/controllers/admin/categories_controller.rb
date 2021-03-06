module Admin
  class CategoriesController < BaseController
    before_action :require_authentication #, only: %i[edit update]
    before_action :set_category! , only: %i[show edit update destroy]
    before_action :authorize_category!
    after_action :verify_authorized

    def index 
      @pagy, @categories = pagy Category.order(created_at: :desc)
    end 

    def new 
      @category = Category.new
    end 

    def create
      @category = Category.new category_params 
      if @category.save    
        flash[:success] = "Category created"
        redirect_to admin_categories_path
      else
        render :new
      end
    end 

    def edit 
    end 
  
    def update
      if @category.update category_params 
        flash[:success] = "Category updated"
        redirect_to admin_categories_path
      else
        render :edit
      end 
    end 

    def destroy
      @category.destroy
      flash[:success] = "Category deleted"
      redirect_to admin_categories_path
    end

    private 

    def set_category!
      @category = Category.find params[:id]
    end 
  
    def category_params
      params.require(:category).permit(:name)
    end 

    def authorize_category!
      authorize(@category || Category)
    end
  end
end