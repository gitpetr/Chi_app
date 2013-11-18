Feature: Photo Creating
  In order to create an photo
  As an admin
  I should create a photo after sign-in

  Background:
    Given I logged in as admin
    And There is album with photos
    When I go to page with albums
    And I open an album
    And I click link "Добавить фотографии"

  Scenario: Creating
    And I upload photo
    Then I should see message that photo has been uploaded

  Scenario: Errors
    And I click button "Загрузить"
    Then I should see errors
