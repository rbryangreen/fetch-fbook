Before('@like') do
  @like = true
end

# initialize login page version
Before do
  $version = nil
end

After do
  if @like
    # Reset state of Like button after a test with tag @like has been run.
    unless exists { ProfilePage.unlike_button }
      ProfilePage.like_button.click
    end
    ProfilePage.unlike_button.click
    sleep 0.5
  end
  $driver.restart
end
