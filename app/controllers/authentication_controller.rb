class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: :login

  def login
    command = AuthenticateUser.new(params[:email], params[:password]).call
    if command.success?
      json_response(auth_token: command.result)
    else
      json_response(error: command.errors, status: :unauthorized)
    end
  end

  def logout
    @current_user.tokens.create!(token: @token)
    json_response(message: Messages.logout)
  end
end
