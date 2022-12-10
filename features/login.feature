@login
Feature: Facebook Log In page
  As a Facebook user
  I want to log into the app
  So that I can use it

  Background: I open the Facebook app
    Given I am on the Facebook Log In page

    Scenario: The log in fields are correctly displayed
      Then the Log In fields are correctly displayed

    Scenario: Log into Facebook
      When I set the Username field to mcfacebook82@gmail.com
      And I set the Password field to theDivisionbell45!
      And I tap on the Log In button
      Then I am logged into Facebook

    Scenario: Failed Log in attempt with email not associated with Facebook
      When I set the Username field to stustu@mailinator.com
      And I set the Password field to badpassword123
      And I tap on the Log In button
      And I see an error message that stustu@mailinator.com is not a recognized email

    Scenario: Failed Log in attempt due to bad password
      When I set the Username field to mcfacebook82@gmail.com
      And I set the Password field to badpassword123
      And I tap on the Log In button
      And I see an error message indicating an incorrect password
