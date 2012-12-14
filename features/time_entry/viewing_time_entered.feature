Feature: Viewing time for tickets
  In order to see the detail of time spent on a ticket
  As a user
  I want to be able to list time entries for a ticket

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
    And "user@example.com" has created a time entry for this ticket
      | work_date  | duration_minutes |
      | 2012-12-06 | 378              |
      | 2012-12-07 | 29               |
      | 2012-12-08 | 65              |
    And "user2@example.com" has created a time entry for this ticket
      | work_date  | duration_minutes |
      | 2012-12-05 | 102              |
      | 2012-12-09 | 16               |
    Given I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"

    Scenario: Viewing list of entries
      Then I should see "12/06/2012"
      And I should see "6:18"
      And I should see "12/08/2012"
      And I should see "1:05"
