Feature: Sermons list
  In order to to show sermons
  As an any user
  I should not see sermons if they has not been uploaded

  Scenario Outline: There are no sermons
    Given <I'm logged in or not>
    And There are 0 sermons
    When I go to page with sermons
    Then I should be on sermon index page
    And <I should or shouldn't see upload button>

  Examples:
    | I'm logged in or not | I should or shouldn't see upload button   |
    | I logged in as admin | I should see button to upload a sermon    |
    | I not logged in      | I shouldn't see button to upload a sermon |




