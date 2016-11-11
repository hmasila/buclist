module HelperSpecs
  def json
    JSON.parse(response.body)
  end

  def token(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers(user_id)
    headers["Authorization"] = token(user_id)
  end

  def headers
    {
      "Accept" => "application/vnd.buclist.v1+json"
    }
  end
end
