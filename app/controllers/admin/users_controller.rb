class Admin::UsersController < ApplicationController
  before_action :requiere_authentication #, only: %i[edit update]

  def index 
    @pagy, @users = pagy User.order(created_at: :desc)
  end 
end 