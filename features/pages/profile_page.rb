class ProfilePage

  # Locates the top post authored by Fetch
  def self.fetch_post
    $driver.find_element(accessibility_id: "Author's name, Fetch")
  end

  # The button used to like a Facebook profile
  def self.like_button
    $driver.find_element(accessibility_id: 'like button')
  end

  # The 'Post' header on a Facebook profile (filters displayed results to Posts only)
  def self.posts
    $driver.xpath("//android.widget.TextView[contains(@content-desc, 'Posts')]")
  end

  # The button used to unlike a Facebook profile
  def self.unlike_button
    $driver.find_element(accessibility_id: 'Unlike')
  end

end