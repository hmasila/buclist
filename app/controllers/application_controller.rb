class ApplicationController < ActionController::API
  include Messages
  include JsonResponse
  include BucketlistConcerns

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    result = AuthorizeApiRequest.call(request.headers)
    @token = result[:token]
    @current_user = result[:user]
    if expired_tokens.include? @token
      raise(ExceptionHandler::ExpiredSignature, Message.expired_token)
    end
    @current_user
  end

  def expired_tokens
    @current_user.tokens.pluck(:token)
  end
end
