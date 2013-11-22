@javascript

Feature: Showing rich text editor
  In order to manage articles
  As an admin
  I should see rich text editor after sign-in

  Background:
    Given I logged in as admin
    When I go to page with articles
    And I click link "Новая статья"

  Scenario: Showing editor on article's new page (ru)
    Then I should see editor on article new page

  Scenario: Showing editor on article's new page (en)
    And I click English flag
    Then I should see editor on article new page