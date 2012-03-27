Feature: Article Profile page

  As a Visitor
  I can see the article detail

  Scenario: I can see an article
    Given an article exists
    And I am on the article page
    And I see the info for the article
