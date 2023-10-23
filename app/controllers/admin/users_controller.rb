class Admin::UsersController < ApplicationController
  before_action :check_user_admin

  def index
    @users = User.page params[:page]
  end

  private

  def check_user_admin
    return if current_user.admin?

    flash[:alert] = 'Unauthorized Access'
    redirect_to root_path
  end
end
