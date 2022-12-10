# Page Objects on the Landing page

class HomePage

  # The Facebook Search button (magnifying glass) on the Activity Feed
  def self.search_button
    $driver.find_element(accessibility_id: 'Search')
  end

  # The field used to begin making a Facebook post on the Activity Feed
  def self.whats_on_your_mind
    $driver.find_element(accessibility_id: 'Make a post on Facebook')
  end

end