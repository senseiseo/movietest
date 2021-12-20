class ApplicationController < ActionController::Base
  before_action :all_categories
  
  include ErrorHandling
  include Pagy::Backend
  include Authentication

  def all_categories
    @all_categories = Category.all
  end 
end
