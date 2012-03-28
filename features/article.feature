Feature: Article page

  As a Visitor
  I can see the article detail

  Scenario: I can create an article
    Given the date is freezed
    And a category exists
    And I am logged in as user "elias@innku.com"
    And I am on the new article page
    And I fill the article form
    Then the article should have been created

  Scenario: I can see an article
    Given an article exists
    And I am on the article page
    Then I see the info for the article

  @javascript
  Scenario: The author can suscribe to an article comment
    Given I am logged in as user "elias@innku.com"
    And I have created an article
    And I am on the edit article page for that article
    And I try to suscribe to the article comments
    Then the article should have been updated
