class SearchPage

  # The 'All' header above the search results
  def self.all_search_results
    $driver.find_element(accessibility_id: 'All search results')
  end

  # The 'Pages' header above the search results (filters search results to Pages only)
  def self.pages_search_results
    $driver.find_element(accessibility_id: 'Pages search results')
  end

  # Use this to enter a value into the search field
  # @param search_term [String] The term you want to search for
  def self.search(search_term)
    search_field.clear
    search_field.click
    $driver.action.send_keys(search_term).send_keys(:enter).perform
  end

  # The text entry field for searching
  def self.search_field
    $driver.xpath('//android.widget.EditText')
  end

  # Locates the top search result returned in your previous search
  def self.top_search_result
    $driver.xpath("//android.view.ViewGroup[contains(@content-desc, 'Like')]/parent::node()")
  end

end