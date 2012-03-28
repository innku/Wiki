Feature: Article page

  As a Visitor
  I can see the article detail

  Background:
    Given the date is freezed

  Scenario: I can create an article
    Given a category exists
    And I am logged in as user "elias@innku.com"
    And I am on the new article page
    And I fill the article form
    Then the article should have been created

  Scenario: I can see an article
    Given an article exists
    And I am on the article page
    Then I see the info for the article
