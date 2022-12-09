And(/^I search for (.*) in Facebook pages$/) do |search_term|
  wait_true(timeout: 30) { exists { SearchPage.search_field } }
  SearchPage.search(search_term)
  # If Pages search header is not visible, swipe the headers to the left
  unless $driver.exists { SearchPage.pages_filter }
    swipe_using_elements('accessibility_id', 'Events search results', 'accessibility_id', 'Posts search results')
  end
  wait_true { exists { SearchPage.pages_search_results } }
  SearchPage.pages_search_results.click
end

And(/^I tap on the top search result$/) do
  SearchPage.top_search_result.click
end

# Use these combined steps in the Background to get a user to a Facebook profile
And(/^I navigate to the (.*) Facebook page$/) do |page|
  step 'I tap the search button'
  step "I search for #{page} in Facebook pages"
  step 'I tap on the top search result'
  step 'I am on the Fetch Rewards Facebook page'
end