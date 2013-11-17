@javascript
Feature: Photo slides
  In order to to show slideshow
  As an any user
  I should see slideshow if photo has been uploaded

  Background:
    Given There is album with photos for slideshow
    And I go to page with albums
    When I open an album

  Scenario: Slideshow be clicking photo
    And I click image
    Then I should see that modal with slideshow opened

  Scenario: Slideshow by clicking slideshow button
    And I click link "Показать фотографии"
    Then I should see that modal with slideshow opened

  Scenario: Slideshow transition
    And I click link "Показать фотографии"
    Then I should see text of one image
    When I click link "›"
    Then I should see text of next image

  Scenario: Slideshow hiding
    And I click link "Показать фотографии"
    Then I should see that modal with slideshow opened
    When I close modal window
    Then I should see that modal with slideshow is hidden




