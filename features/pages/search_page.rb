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
    $driver.find_element(xpath: '//android.widget.EditText')
  end

  def self.top_search_result
    $driver.find_element(xpath: '//android.view.ViewGroup[@content-desc="Like Page"]/parent::node()')
  end

end