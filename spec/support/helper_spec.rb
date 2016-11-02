module HelperSpecs
  def json
    JSON.parse(response.body)
  end

  def token_generator(user_id)
    Api::JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    Api::JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => token_generator(user.id),
      "Content-Type" => "application/json",
      "Accept" => "application/vnd.buclist.v1+json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json",
      "Accept" => "application/vnd.buclist.v1+json"
    }
  end

  def signin_helper(email = user.email, pass = user.password)
    post "/auth/login", { email: email, password: pass },
         HTTP_ACCEPT: "application/vnd.buclist.v1+json"
  end

  def token_helper(email = user.email, pass = user.password)
    signin_helper(email, pass)
    parsed_response = JSON.parse response.body

    parsed_response["token"]
  end
end
