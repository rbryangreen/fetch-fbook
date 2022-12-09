class ProfilePage

  def self.fetch_post
    $driver.find_element(accessibility_id: "Author's name, Fetch")
  end

  def self.like_button
    $driver.find_element(accessibility_id: 'like button')
  end

  def self.posts
    $driver.xpath("//android.widget.TextView[contains(@content-desc, 'Posts')]")
  end

  def self.unlike_button
    $driver.find_element(accessibility_id: 'Unlike')
  end

end