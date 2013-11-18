@javascript
Feature: Photo Deleting
  In order to destroy an photo
  As an admin
  I should destroy an existing photo after sign-in

  Scenario: Deleting
    Given I logged in as admin
    And There is album with photos
    When I go to page with albums
    And I open an album
    And I delete an photo
    Then I should see message that photo has been deleted