class SearchPage

  def self.all_search_results
    $driver.find_element(accessibility_id: 'All search results')
  end

  def self.pages_search_results
    $driver.find_element(accessibility_id: 'Pages search results')
  end

  # @param search_term [String] The term you want to search for
  # @param enter [Boolean] Use true if you wish to tap the enter key after the search
  def self.search(search_term)
    search_field.clear
    search_field.click
    $driver.action.send_keys(search_term).send_keys(:enter).perform
  end

  def self.search_field
    $driver.xpath('//android.widget.EditText')
  end

  # Locates the top search result returned in your previous search
  def self.top_search_result
    $driver.xpath("//android.view.ViewGroup[contains(@content-desc, 'Like')]/parent::node()")
  end

end