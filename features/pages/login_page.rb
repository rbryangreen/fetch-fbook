class LoginPage

  def self.create_new_facebook_account
    $driver.find_element(accessibility_id: 'Create new Facebook account')
  end

  def self.find_account_button
    $driver.xpath('//android.widget.Button[contains(@text, "FIND ACCOUNT")]')
  end

  def loading_spinner
    $driver.find_element(class: 'android.widget.ProgressBar')
  end

  def self.login_button
    $driver.find_element(accessibility_id: 'Log In')
  end

  def self.password
    $driver.find_element(accessibility_id: 'Password')
  end

  def self.phone_or_email
    $driver.find_element(accessibility_id: 'Username')
  end

  # The error message that appears when you try to log in with an email address not associated with a Facebook account
  # @param email_address [String] Pass in the email you expect to see in the error message
  def self.unknown_email_error_msg(email_address)
    $driver.xpath("//android.widget.TextView[contains(@text, \"It looks like #{email_address} isn't connected to an account but we can help you find your account and log in.\")]")
  end

end