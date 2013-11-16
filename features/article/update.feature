Feature: Updating
  In order to update an article
  As an admin
  I should update article after sign-in

  Scenario: Updating existing article
    Given I logged in as admin
    And I have an article
    When I go to page with articles
    And I open an article
    And I update article's fields and then submit
    Then I should see message that article has been updated