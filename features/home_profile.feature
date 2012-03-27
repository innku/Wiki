Feature: Home Profile page

  As a Visitor
  I can see the home page of the wiki

  Scenario: I can see the most recent articles
    Given three new and two old articles exists
    And I am on the home page
    And I see the info for only the new articles in the main section
