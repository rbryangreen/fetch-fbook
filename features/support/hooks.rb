Before('@like') do
  @like = true
end

Before do
  $version = nil
end

After do
  if @like
    # Reset state of Like button
    unless exists { ProfilePage.unlike_button }
      ProfilePage.like_button.click
    end
    ProfilePage.unlike_button.click
    sleep 0.5
  end
  $driver.restart
end
