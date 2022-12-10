# Page Objects on the Profile page

class ProfilePage

  # Locates the top post authored by Fetch
  def self.fetch_post
    # Swipe up on the Post timeline until the ID is found
    3.times do
      unless $driver.exists { $driver.find_element(accessibility_id: "Author's name, Fetch") }
        swipe_direction('up')
      end
    end
    $driver.find_element(accessibility_id: "Author's name, Fetch")
  end

  # The button used to like a Facebook profile
  def self.like_button
    # Making sure we are swiped up to the top of the profile before checking for the Like button
    3.times do
      unless $driver.exists { $driver.find_element(accessibility_id: 'like button') }
        swipe_direction('down')
      end
    end
    swipe_direction('down')
    sleep 0.5
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