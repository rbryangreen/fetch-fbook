# After running the 'Like Button' scenario, this will go back and Unlike the page, in order to reset state.
After('@like') do
  unless exists { ProfilePage.unlike_button }
    ProfilePage.like_button.click
  end
  ProfilePage.unlike_button.click
end

After do
  $driver.restart
end

# After do
#   begin
#     $driver.driver.terminate_app
#   rescue
#     log 'Rescue from resetting the driver'
#   end
# end
