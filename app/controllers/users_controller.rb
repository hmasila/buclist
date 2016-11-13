class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.new(user_params)
    if user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Messages.signup_successful, auth_token: auth_token }
      json_response(response, :created)
    else
      json_response(error: Messages.signup_failed, status: 422)
    end
  end

  private

  def user_params
    params.permit(:firstname, :lastname, :email, :password)
  end
end
