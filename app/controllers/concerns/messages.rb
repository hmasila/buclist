module Messages
  def creation_failed_message
    "#{controller_name.singularize.capitalize} not created, try again"
  end

  def update_failed_message
    "#{controller_name.singularize.capitalize} not updated, try again"
  end

  def delete__success_message
    "#{controller_name.singularize.capitalize} deleted"
  end

  def not_permitted_message
    "You do not own that #{controller_name.singularize.capitalize}"
  end

  def unauthorized
    "Not Authorized"
  end

  def logout_message
    "User logged out of all active sessions"
  end

  def invalid_login_message
    "Invalid Credentials Detected"
  end

  def expired_token_message
    "This token has expired"
  end
end
