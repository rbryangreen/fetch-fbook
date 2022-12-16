# Page Objects on the Landing page/activity feed

class HomePage

  # The Facebook Search button (magnifying glass) on the Activity Feed
  # Because the app randomly loads two different versions of this button, I've accounted for both here.
  def self.search_button
    if $version = 1
      $driver.find_element(accessibility_id: 'Search Facebook')
    else
      $driver.xpath('//android.widget.Button[@content-desc="Search"]')
    end
  end

  # The field used to begin making a Facebook post on the Activity Feed
  def self.whats_on_your_mind
    $driver.find_element(accessibility_id: 'Make a post on Facebook')
  end

end
