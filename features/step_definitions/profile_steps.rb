Then(/^I am on the Fetch Rewards Facebook page$/) do
  ProfilePage.posts.click
  sleep 0.5
  expect( exists { ProfilePage.fetch_post } ).to be true
end

And(/^I click the Like button$/) do
  ProfilePage.like_button.click
  sleep 1
end

And(/^I have liked the page$/) do
  step 'I click the Like button'
  # The presence of the Unlike button means the user has liked this page
  expect( exists { ProfilePage.unlike_button } ).to be true
end