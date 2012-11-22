Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there are the following users:
      | email             | password | admin |
      | admin@example.com | password | true  |
      | user@example.com  | password | false |
    And I am signed in as "admin@example.com"
    And there is a project called "Time Tracker"

    When I follow "Admin"
    And I follow "Users"
    And I follow "user@example.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "View" for "Time Tracker"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@example.com"
    Then I should see "Time Tracker"