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

  # private
  #
  # def authenticate_request
  #   return token_not_authorized unless decode_auth_header.class.name == "User"
  #   @current_user = decode_auth_header
  # end
  #
  # def token_not_authorized
  #   json_response(message: not_authorized_message, status: 401)
  # end
  #
  # def decode_auth_header
  #   return nil unless request.headers["Authorization"].present?
  #   header_token = request.headers["Authorization"].split(" ").last
  #   decode_auth_token ||= JsonWebToken.decode(header_token)
  #   @user ||= User.find_by(id: decode_auth_token[:user_id]) if decode_auth_token
  # end
end
