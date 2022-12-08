class LoginPage

  def self.create_new_facebook_account
    $driver.find_element(accessibility_id: 'Create new Facebook account')
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

end