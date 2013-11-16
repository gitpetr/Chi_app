Feature: Google's map existance
  In order to show correct contacts
  As an user
  I should see map on the contact's page

  Scenario: Google map
    Given There is contact
    When I go to contacts
    Then I should see the map