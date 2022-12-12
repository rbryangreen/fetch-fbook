And(/^I am logged into Facebook$/) do
  sleep 3
  # A message appears sometimes, asking if you'd like to save Login info. If it appears, this will dismiss it.
  5.times do
    if exists { LoginPage.not_now_button }
      LoginPage.not_now_button.click
      sleep 1
    end
  end
  $driver.wait_true(timeout: 60) { exists { HomePage.whats_on_your_mind } }
  # Seeing the "What's on your mind" field verifies we are logged in
  expect(exists { HomePage.whats_on_your_mind } ).to be true
end

And(/^I tap the search button$/) do
  sleep 2 # although the page loads, the search button is not immediately clickable
  HomePage.search_button.click
end