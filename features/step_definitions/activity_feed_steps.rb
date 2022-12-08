And(/^I am logged into Facebook$/) do
  $driver.wait_true(timeout: 60) { exists { HomePage.whats_on_your_mind } }
  expect(exists { HomePage.whats_on_your_mind } ).to be true
end