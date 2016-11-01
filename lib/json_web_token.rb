class JsonWebToken
  def self.encode(payload, expiration = 1.hour.from_now)
    payload[:exp] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
  rescue
    nil
  end
end
