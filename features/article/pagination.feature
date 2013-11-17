Feature: Articles pagination
  In order to not show too many articles on sinle page
  As an any user
  I should see few articles per page

  Scenario: Pagination
    Given There are 6 articles
    When I go to page with articles
    Then I should see pagination