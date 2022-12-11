# Page Objects and helper methods on the Login page

class LoginPage

  # The "Create New Facebook Account" button.
  def self.create_new_facebook_btn
    if $version == 1
      $driver.find_element(accessibility_id: 'Create new Facebook account')
    else
      $driver.xpath('//android.widget.Button[@content-desc="Create new account"]')
    end
  end

  # After the Login page loads, set a variable to determine which version of the page it is.
  def self.determine_page_version
    if $driver.exists { $driver.find_element(accessibility_id: 'Create new Facebook account') }
      puts "Login page v1 loaded"
      $version = 1
    else
      puts "Login page v2 loaded"
      $version = 2
    end
  end

  # The Find Account button that appears when the user enters an email not associated with a Facebook account
  def self.find_account_button
    $driver.xpath('//android.widget.Button[@text="FIND ACCOUNT"]')
  end

  # Error message header that appears when a bad password has been entered
  def self.incorrect_password_header
    $driver.xpath('//android.widget.TextView[@text="Incorrect password"]')
  end

  # Error message body that appears when an incorrect password has been entered
  def self.incorrect_password_message
    $driver.xpath('//android.widget.TextView[@text="The password you entered is incorrect. Please try again or get a code to log in."]')
  end

  # The "Not now" button that appears sometimes after entering login credentials
  def self.not_now_button
    $driver.xpath('//android.view.View[@content-desc="Not now"]')
  end

  # OK button that appears in the incorrect password error message
  def self.ok_button
    $driver.xpath('//android.widget.Button[@text="OK"]')
  end

  # Appears while a page is loading
  def loading_spinner
    $driver.find_element(class: 'android.widget.ProgressBar')
  end

  # The button to log in a user
  # The app randomly serves two different versions of this page, so I modeled both.
  def self.login_button
    if $version == 1
      $driver.find_element(accessibility_id: 'Log In')
    else
      $driver.xpath('//android.widget.Button[@content-desc="Log in"]')
    end
  end

  # The Password text entry field
  def self.password
    $driver.find_element(accessibility_id: 'Password')
  end

  # The error message that appears when you try to log in with an email address not associated with a Facebook account
  # @param email_address [String] Pass in the email you expect to see in the error message
  def self.unknown_email_error_msg(email_address)
    $driver.xpath("//android.widget.TextView[contains(@text, \"It looks like #{email_address} isn't connected to an account but we can help you find your account and log in.\")]")
  end

  # The Username field for logging in. (placehold text says 'Phone or email' on the login page)
  # The app randomly serves two different versions of this page, so I modeled both.
  def self.user_name
    if $version == 1
      $driver.find_element(accessibility_id: 'Username')
    else
      $driver.find_element(accessibility_id: 'Mobile number or email')
    end
  end

  def self.wait_for_login_page
    20.times do
      exist = []
      exist << $driver.exists { create_new_facebook_btn_1 }
      exist << $driver.exists { create_new_facebook_btn_2 }
      if exist.include? true
        break
      else
        sleep 0.5
      end
    end
  end

end