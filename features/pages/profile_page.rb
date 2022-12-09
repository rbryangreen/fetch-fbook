class ProfilePage

  def self.posts
    $driver.find_element(accessibility_id: 'Posts, tab 2 of 8')
  end

  def self.fetch_post
    $driver.find_element(accessibility_id: "Author's name, Fetch")
  end

end