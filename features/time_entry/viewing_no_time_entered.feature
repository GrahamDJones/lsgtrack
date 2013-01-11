Feature: Viewing time for tickets
  In order to see the detail of time spent on a ticket
  As a user
  I want to be able to see a sensible message when there are no time entries for a ticket

  Background:
    Given there are the following users:
      | email             | password |
      | user@example.com  | password |
      | user2@example.com | password |
    And I am signed in as "user@example.com"
    And there is a default ticket state called "Open"
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can report time on the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title            | description                            |
      | Work on this one | You should be able to report your time |
    Given I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"

  Scenario: Viewing no entries message
    Then I should see "No time entries have been recorded"
    And I should not see "Person"
