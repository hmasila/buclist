class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { error: "not_created_message" }, status: 400
    end
  end

  private

  def user_params
    params.permit(:firstname, :lastname, :email, :password)
  end
end
