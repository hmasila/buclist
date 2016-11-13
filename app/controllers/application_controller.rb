class ApplicationController < ActionController::API
  include JsonResponse
  include BucketlistConcerns
  include ExceptionHandler

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    result = AuthorizeApiRequest.new(request.headers).authorize
    @token = result[:token]
    @current_user = result[:user]
    if expired_tokens.include? @token
      return json_response(
        { message: Messages.expired_token },
        :unauthorized
      )
    else
      @current_user
    end
  end

  def expired_tokens
    @current_user.tokens.pluck(:token)
  end
end
