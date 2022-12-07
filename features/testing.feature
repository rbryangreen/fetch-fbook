Feature: Facebook Log In page

  Scenario: The log in fields are correctly displayed
    Given I am on the Facebook Log In page
    Then the Log In fields are correctly displayed
    
  Scenario: Log into Facebook
    Given I am on the Facebook Log In page
    And I set the Username field to bg.automation82@gmail.com
    And I set the Password field to 1kingGizzard1
    And