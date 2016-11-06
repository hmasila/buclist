class ApplicationController < ActionController::API
  include Messages
  include JsonResponse

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    json_response(error: unauthorized, status: 401) unless @current_user
  end
end
