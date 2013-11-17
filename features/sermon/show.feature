Feature: Sermon
  In order to to show sermons
  As an any user
  I should see sermon if they has been uploaded

  Background:
    Given There is 1 sermon
    When I go to page with sermons

  Scenario: Show page
    Then I should be on sermon show page

  @javascript
  Scenario: Audio player
    And I should see audio player