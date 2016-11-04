class UsersController < ApplicationController

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
