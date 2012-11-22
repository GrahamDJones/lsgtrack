Feature: Hidden Links
  In order to clean up the user experience
  As the system
  I want to hide links from users who can not access them

  Background:
    Given there are the following users:
      | email             | password   | admin |
      | user@example.com  | password   | false  |
      | admin@example.com | password   | true  |
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project

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