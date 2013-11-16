Feature: Contact's updating
  In order to update contact
  As an admin
  I should update contact after sign in

  Scenario: Updating
    Given I logged in as admin
    And There is contact
    When I go to contacts
    And I open contact to update
    And I fill fields for contact and submit
    Then I should see message that contact has been updated