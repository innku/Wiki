Feature: User Profile page

  As a User
  I can see my info in my summary page

  Background:
    Given I am logged in as user "elias@innku.com"

  Scenario: I can see the drafts of all the users
    And a draft created by that user exists
    And a draft created by another user exists
    And I am on that user page
    Then I see the info for both articles
