Feature: Facebook profile pages

  Background: User is logged into Facebook
    Given I have logged in:
      | user_name | mcfacebook82@gmail.com |
      | password  | theDivisionbell45!     |
    And I navigate to the Fetch Rewards Facebook page

    @like
    Scenario: I can Like a Facebook profile
      When I click the Like button
      Then I have liked the page