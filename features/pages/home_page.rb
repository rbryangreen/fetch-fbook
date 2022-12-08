class HomePage

  def self.whats_on_your_mind
    $driver.find_element(accessibility_id: 'Make a post on Facebook')
  end

end