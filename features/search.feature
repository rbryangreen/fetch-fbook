Feature: Facebook search

Scenario: I can Search for Fetch Rewards and go to their Facebook page
  Given I am on the Facebook Log In page
  And I set the Username field to mcfacebook82@gmail.com
  And I set the Password field to theDivisionbell45!
  And I tap on the Log In button
  Then I am logged into Facebook
  And I tap the search button
  And I search for Fetch Rewards in Facebook pages
  And I tap on the top search result
  Then I am on the Fetch Rewards Facebook page