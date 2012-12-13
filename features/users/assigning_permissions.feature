Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there is a default ticket state called "New"
    Given there is a ticket state called "Open"
    Given there are the following users:
      | email             | password | admin |
      | admin@example.com | password | true  |
      | user@example.com  | password | false |
    And I am signed in as "admin@example.com"
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | Eye-blindingly so |
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

  Scenario: Creating tickets for a project
    When I check "View" for "Time Tracker"
    When I check "Create tickets" for "Time Tracker"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."

  Scenario: Updating a ticket for a project
    When I check "View" for "Time Tracker"
    And I check "Edit tickets" for "Time Tracker"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated"

  Scenario: Deleting a ticket for a project
    When I check "View" for "Time Tracker"
    And I check "Delete tickets" for "Time Tracker"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."

  Scenario: Changing ticket states for a ticket
    When I check "View" for "Time Tracker"
    And I check "Change ticket states" for "Time Tracker"
    And I press "Update"
    Then I should see "Permissions updated"
    And I follow "Sign out"
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    And I fill in "Text" with "Opening this ticket"
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created"
    And I should see "Open" within "#ticket .state"

  Scenario: Reporting time for a project
    When I check "View" for "Time Tracker"
    When I check "Report Time" for "Time Tracker"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Time Entry"
    And I fill in "Date" with "12/15/2012"
    And I fill in "Duration" with "5"
    And I press "Save"
    Then I should see "Time Entry has been created."
