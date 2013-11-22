@javascript

Feature: Showing rich text editor
  In order to manage welcome text
  As an admin
  I should see rich text editor after sign-in

  Background:
    Given I have welcome message
    And I logged in as admin
    When I go to home page
    And I click link "Редактировать"

  Scenario: Showing editor on welcome page (ru)
    Then I should see editor on welcome edit page

  Scenario: Showing editor on welcome page (en)
    And I click English flag
    Then I should see editor on welcome edit page