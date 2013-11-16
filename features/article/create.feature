Feature: Creation
  In order to create an article
  As an admin
  I should create article after sign-in

  Scenario: New article
    Given I logged in as admin
    When I go to page with articles
    And I fill article's fields and submit
    Then I should see message that article has been created




