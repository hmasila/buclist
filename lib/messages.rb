class Messages
  class << self
    def not_found(resource = "resource")
      "Sorry, #{resource} not found."
    end

    def unauthorized
      "Unauthorized request. Please login to continue."
    end

    def invalid_route
      "Invalid route, refer to doc"
    end

    def logout
      "Logged out successfully"
    end

    def login
      "Logged in successfully"
    end

    def signup_successful
      "Account created successfully"
    end

    def invalid_credentials
      "Invalid Credentials"
    end

    def signup_failed
      "Account could not be created"
    end

    def invalid_token
      "Invalid token"
    end

    def missing_token
      "Missing token"
    end

    def expired_token
      "Token has expired. Please login to continue."
    end

    def deleted(resource)
      "#{resource} deleted successfully"
    end
  end
end
