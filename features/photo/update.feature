Feature: Photo Updating
  In order to update an photo
  As an admin
  I should update an existing photo after sign-in

  Scenario: Updating
    Given I logged in as admin
    And There is album with photos
    When I go to page with albums
    And I open an album
    And I open an photo to edit
    And I update photo description
    Then I should see message that photo has been updated