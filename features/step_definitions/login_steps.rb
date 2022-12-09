Given(/^I am on the Facebook Log In page$/) do
  # Wait ensures the page is loaded
  $driver.wait_true(timeout: 60) { exists { LoginPage.create_new_facebook_account } }
  expect(exists { LoginPage.create_new_facebook_account } ).to be true
end

Then(/^the Log In fields are correctly displayed$/) do
  expect(exists { LoginPage.user_name } ).to be true
  expect(exists { LoginPage.password } ).to be true
end

Then(/^I set the Username field to (.*)$/) do |user_name|
  LoginPage.user_name.send_keys(user_name)
end

And(/^I set the Password field to (.*)$/) do |password|
  LoginPage.password.send_keys(password)
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
  step "I set the Username field to #{table.rows_hash['user_name']}"
  step "I set the Password field to #{table.rows_hash['password']}"
  step 'I tap on the Log In button'
  step 'I am logged into Facebook'
end
