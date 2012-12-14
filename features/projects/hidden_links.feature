Feature: Hidden Links
  In order to clean up the user experience
  As the system
  I want to hide links from users who can not access them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@example.com   | password | false |
      | admin@example.com  | password | true  |
      | admin2@example.com | password | true  |
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" has created a ticket for this project:
      | title  | description                 |
      | Shiny! | Gradients Starbursts! Oh My |
    And there is a project called "No Tickets"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can view the "No Tickets" project

  Scenario: New project link is hidden for not-signed in users
    Given I am on the homepage
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for standard users
    Given I am signed in as "user@example.com"
    Then I should not see the "New Project" link

  Scenario: New project link is show to admins
    Given I am signed in as "admin@example.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for standard users
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown to admins
    Given I am signed in as "admin@example.com"
    When I follow "Time Tracker"
    Then I should see the "Edit Project" link

  Scenario: Delete project link is hidden for standard users
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown to admins
    Given I am signed in as "admin@example.com"
    When I follow "Time Tracker"
    Then I should see the "Delete Project" link

  Scenario: New ticket link is shown to a user with permission
    Given "user@example.com" can create tickets on the "Time Tracker" project
    And I am signed in as "user@example.com"
    When I follow "Time Tracker"
    Then I should see the "New Ticket" link

  Scenario: New ticket link is hidden from a user without permission
    When I am signed in as "user@example.com"
    When I follow "Time Tracker"
    Then I should not see the "New Ticket" link

  Scenario: New ticket link is shown to admins
    When I am signed in as "admin@example.com"
    When I follow "Time Tracker"
    Then I should see the "New Ticket" link

  Scenario: Edit ticket link is shown to a user with permission
    Given "user@example.com" can edit tickets on the "Time Tracker" project
    And I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should see the "Edit" link

  Scenario: Edit ticket link is hidden from a user without permission
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should not see the "Edit" link

  Scenario: Edit ticket link is shown to a user with permission
    And I am signed in as "admin@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should see the "Edit" link

  Scenario: Delete ticket link is shown to a user with permission
    Given "user@example.com" can delete tickets on the "Time Tracker" project
    And I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should see the "Delete" link

  Scenario: Delete ticket link is hidden from a user without permission
    Given I am signed in as "user@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should not see the "Delete" link

  Scenario: Delete ticket link is shown to a user with permission
    And I am signed in as "admin@example.com"
    When I follow "Time Tracker"
    And I follow "Shiny!"
    Then I should see the "Delete" link

  Scenario: Permissions link not shown for admin users
    Given I am signed in as "admin@example.com"
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"
    And I follow "admin2@example.com"
    Then I should not see "Permissions"

  Scenario: The Time Entry link is hidden for projects with no tickets
    Given "user@example.com" can report time on the "No Tickets" project
    Given I am signed in as "user@example.com"
    When I follow "No Tickets"
    Then I should not see "Time Entry"
