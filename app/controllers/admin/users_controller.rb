class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_admin

  def index
    @users = User.page params[:page]
  end

  private

  def check_user_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end
end
