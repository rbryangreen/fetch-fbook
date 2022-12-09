class HomePage

  def self.search_button
    $driver.find_element(accessibility_id: 'Search')
  end

  def self.whats_on_your_mind
    $driver.find_element(accessibility_id: 'Make a post on Facebook')
  end

end