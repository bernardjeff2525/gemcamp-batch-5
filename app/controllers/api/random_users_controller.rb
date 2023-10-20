class Api::RandomUsersController < ApplicationController
  def show
    random_user_service = RandomUserService.new
    @random_user = random_user_service.random_user
  end
end