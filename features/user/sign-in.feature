Feature: User sign in/out
  In order to sign in in system
  As an new user
  I should be able to login

  Background:
    Given There is a user
    When I visit page to sign in

  Scenario: Sign in failure
    And I try to sign in with incorrect data
    Then I should see message that email or password is wrong

  Scenario: Success sign in
    And I try to sign in with correct data
    Then I should see message that i signed in

  Scenario: Success sign out
    And I try to sign in with correct data
    And I click link "Выйти"
    Then I should see message that i signed out


