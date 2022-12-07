Given(/^I am on the Facebook Log In page$/) do
  $driver.wait_true(timeout: 60) { exists { LoginPage.create_new_facebook_account } }
  expect( exists { LoginPage.create_new_facebook_account } ).to be true
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
