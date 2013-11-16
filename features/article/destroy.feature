@javascript
Feature: Deleting
  In order to destroy an article
  As an admin
  I should destroy an existing article after sign-in

  Scenario: Deleting existing article
    Given I logged in as admin
    And I have an article
    When I go to page with articles
    And I delete the article
    Then I should see message that article has been deleted