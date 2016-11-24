class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :login

  def login
    auth_token = AuthenticateUser.new(params[:email], params[:password]).call
    if auth_token
      response = { auth_token: auth_token, message: Messages.login }
      json_response(response)
    else
      json_response({ error: auth_token.errors }, :unauthorized)
    end
  end

  def logout
    @current_user.tokens.create!(token: @token)
    json_response(message: Messages.logout)
  end
end
