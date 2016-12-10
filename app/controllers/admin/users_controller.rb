class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    current_user = User.find(params[:id])
    current_user.destroy
    flash[:success] = "User deleted."
    redirect_to admin_users_url
  end

end
