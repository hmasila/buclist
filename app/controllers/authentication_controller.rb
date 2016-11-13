class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :login

  def login
    command = AuthenticateUser.new(params[:email], params[:password]).call
    if command.success?
      response = { auth_token: command.result, message: Messages.login }
      json_response(response)
    else
      json_response({ error: command.errors }, :unauthorized)
    end
  end

  def logout
    @current_user.tokens.create!(token: @token)
    json_response(message: Messages.logout)
  end
end
