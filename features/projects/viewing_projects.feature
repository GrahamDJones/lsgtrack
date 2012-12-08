Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there is a default project state called "Open"
    Given there is an admin project state called "Closed"
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And there is a project called "Internet Explorer"

  Scenario: Listing all projects and selecting one
    And I am on the homepage
    Then I should not see "Internet Explorer"
    When I follow "Time Tracker"
    Then I should be on the project page for "Time Tracker"
    And I should see "Open" within ".state"

  Scenario: Lists open projects only for non-admin users
    And there is a project called "Time Tracker Two"
    And "user@example.com" can view the "Time Tracker Two" project
    And the project "Time Tracker Two" is closed
    And I am on the homepage
    Then I should see "Time Tracker"
    Then I should not see "Time Tracker Two"
