Feature: User setting
  In order to edit my data
  As an signed in user
  I should be able to manage in my settings

  Scenario: Password changing
    Given I logged in as exisiting user
    When I go to user settings
    And I fill fields to change password
    And I sign out
    And I try to sign in with new password
    Then I should see message that i signed in