class Admin::UsersController < ApplicationController
  before_action :requiere_authentication #, only: %i[edit update]
  before_action :set_user! , only: %i[edit update destroy]

  def index 
    @pagy, @users = pagy User.order(created_at: :desc)
  end 

  def edit 
  end 
  
  def update
    if @user.update user_params 
      flash[:success] = "User updated"
      redirect_to admin_users_path
    else
      render :edit
    end 
  end 

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private 

  def set_user!
    @user = User.find params[:id]
  end 
  
  def user_params 
    params.require(:user).permit(:email, :name, :role, :password, :password_confirmation).merge(admin_edit: true) 
  end 
end 