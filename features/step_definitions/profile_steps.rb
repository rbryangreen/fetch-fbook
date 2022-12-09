Then(/^I am on the Fetch Rewards Facebook page$/) do
  ProfilePage.posts.click
  sleep 0.5
  expect( exists { ProfilePage.fetch_post } ).to be true
end