# Page Objects on the Landing page/activity feed

class HomePage

  # The Facebook Search button (magnifying glass) on the Activity Feed
  def self.search_button
    $driver.xpath('//android.widget.Button[contains(@content-desc, "Search")]')
  end

  # The field used to begin making a Facebook post on the Activity Feed
  def self.whats_on_your_mind
    $driver.find_element(accessibility_id: 'Make a post on Facebook')
  end

end
