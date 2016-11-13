module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class ExpiredToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotSaved, with: :invalid_record
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ExceptionHandler::InvalidToken, with: :access_denied
    rescue_from ExceptionHandler::MissingToken, with: :access_denied
    rescue_from ExceptionHandler::ExpiredToken, with: :access_denied

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ExceptionHandler::AuthenticationError do |e|
      json_response({ message: e.message }, :unauthorized)
    end
  end

  private

  def invalid_record(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  def access_denied(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
