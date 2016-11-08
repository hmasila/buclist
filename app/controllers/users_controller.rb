class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      json_response(error: Messages.invalid_credentials, status: 400)
    end
  end

  private

  def user_params
    params.permit(:firstname, :lastname, :email, :password)
  end
end
