Given(/^I am on the Facebook Log In page$/) do
  $driver.wait_true(timeout: 60) { exists { LoginPage.create_new_facebook_account } }
  expect( exists { LoginPage.create_new_facebook_account } ).to be true
end

Then(/^the Log In fields are correctly displayed$/) do
  expect(exists { LoginPage.phone_or_email } ).to be true
  expect(exists { LoginPage.password } ).to be true
  expect(exists { LoginPage.phone_or_email } ).to be true
end
