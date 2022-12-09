Given(/^I am on the Facebook Log In page$/) do
  $driver.wait_true(timeout: 60) { exists { LoginPage.create_new_facebook_account } }
  expect(exists { LoginPage.create_new_facebook_account } ).to be true
end

Then(/^the Log In fields are correctly displayed$/) do
  expect(exists { LoginPage.phone_or_email } ).to be true
  expect(exists { LoginPage.password } ).to be true
  expect(exists { LoginPage.phone_or_email } ).to be true
end

Then(/^I set the Username field to (.*)$/) do |user_name|
  LoginPage.phone_or_email.send_keys(user_name)
end

And(/^I set the Password field to (.*)$/) do |password|
  LoginPage.password.send_keys(password)
end

And(/^I tap on the Log In button$/) do
  LoginPage.login_button.click
end

Then(/^I see an error message that (.*) is not a recognized email$/) do |email_address|
  $driver.wait_true(timeout: 60) { exists { LoginPage.find_account_button } }
  expect(exists { LoginPage.unknown_email_error_msg(email_address) }).to be true
end

# Use these combined steps for logging in users in Backgrounds.
And(/^I have logged in:$/) do |table|
  step "I set the Username field to #{table.rows_hash['user_name']}"
  step "I set the Password field to #{table.rows_hash['password']}"
  step 'I tap on the Log In button'
  step 'I am logged into Facebook'
end
