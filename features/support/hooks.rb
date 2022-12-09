# After running the 'Like' scenario, this will go back and Unlike the page, in order to reset state.
After('@like') do
  unless exists { ProfilePage.unlike_button }
    ProfilePage.like_button.click
  end
  ProfilePage.unlike_button.click
end