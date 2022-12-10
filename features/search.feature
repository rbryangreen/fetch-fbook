@search
Feature: Facebook search
  As a Facebook user
  I want to search for things that interest me
  So that I can find profiles

  Background: User is logged into Facebook
    Given I have logged in:
      | user_name | mcfacebook82@gmail.com |
      | password  | theDivisionbell45!     |

    Scenario: I can Search for Fetch Rewards and go to their Facebook page
      And I tap the search button
      And I search for Fetch Rewards in Facebook pages
      And I tap on the top search result
      Then I am on the Fetch Rewards Facebook page