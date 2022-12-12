Given(/^I am on the Facebook Log In page$/) do
  LoginPage.wait_for_login_page
  LoginPage.determine_page_version
  expect(exists { LoginPage.create_new_facebook_btn } ).to be true
end

Then(/^the Log In fields are correctly displayed$/) do
  expect(exists { LoginPage.user_name } ).to be true
  expect(exists { LoginPage.password } ).to be true
end

# Because the app randomly loads two different versions of the login page, I've accounted for both here.
Then(/^I set the Username field to (.*)$/) do |user_name|
  if $version == 1
    LoginPage.user_name.send_keys(user_name)
  else
    # A slightly different send_keys approach is needed on v2 of the page
    LoginPage.user_name.click
    $driver.action.send_keys(user_name).perform
  end
end

# Because the app randomly loads two different versions of the login page, I've accounted for both here.
And(/^I set the Password field to (.*)$/) do |password|
  if @version == 1
    LoginPage.password.send_keys(password)
  else
    # A slightly different send_keys approach is needed on v2 of the page
    LoginPage.password.click
    $driver.action.send_keys(password).perform
  end
end

And(/^I tap on the Log In button$/) do
  LoginPage.login_button.click
end

Then(/^I see an error message that (.*) is not a recognized email$/) do |email_address|
  # Wait ensures the page is loaded
  $driver.wait_true(timeout: 60) { exists { LoginPage.find_account_button } }
  expect(exists { LoginPage.unknown_email_error_msg(email_address) }).to be true
end

Then(/^I see an error message indicating an incorrect password$/) do
  # Wait ensures the page is loaded
  $driver.wait_true(timeout: 60) { exists { LoginPage.ok_button } }
  expect(exists { LoginPage.incorrect_password_header }).to be true
  expect(exists { LoginPage.incorrect_password_message }).to be true
end

# Use these combined steps for logging in users in Background statements.
And(/^I have logged in:$/) do |table|
  step "I am on the Facebook Log In page"
  step "I set the Username field to #{table.rows_hash['user_name']}"
  step "I set the Password field to #{table.rows_hash['password']}"
  step 'I tap on the Log In button'
  step 'I am logged into Facebook'
end
