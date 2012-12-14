Feature: Editing time entries
  In order to alter a time entry
  As a user with permission
  I want to be able to alter time entries

  Background:
    Given there are the following users:
      | email             | password |
      | user@example.com  | password |
      | user2@example.com | password |
    And there is a default ticket state called "Open"
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can report time on the "Time Tracker" project
    And "user@example.com" can manage time on the "Time Tracker" project
    And "user2@example.com" can view the "Time Tracker" project
    And "user2@example.com" can report time on the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title            | description                            |
      | Work on this one | You should be able to report your time |
    And "user@example.com" has created a time entry for this ticket
      | work_date  | duration_minutes |
      | 2012-12-31 | 378              |
      | 2012-12-07 | 29               |
      | 2012-12-08 | 65               |
    And "user2@example.com" has created a time entry for this ticket
      | work_date  | duration_minutes |
      | 2012-12-05 | 102              |
      | 2012-12-30 | 16               |

  Scenario: I can change a time entry for myself
    Given I am signed in as "user@example.com"
    And I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"
    Then I should see "Time spent: 9 hours 50 minutes" within "#ticket #time_spent"
    And I follow "Edit" within "#access_time_entry_0"
    And I should see "Edit a time entry"
    And I fill in "Date" with "12/31/2012"
    And I fill in "Duration" with "377"
    And I press "Save"
    Then I should see "Time Entry has been updated."
    And I should see "Time spent: 9 hours 49 minutes" within "#ticket #time_spent"
    And I should see "12/31/2012"
    And I should see "6:17"

  Scenario: I can change a time entry for another user when I have permission
    Given I am signed in as "user@example.com"
    And I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"
    Then I should see "Time spent: 9 hours 50 minutes" within "#ticket #time_spent"
    And I follow "Edit" within "#access_time_entry_1"
    And I should see "Edit a time entry"
    And I fill in "Duration" with "15"
    And I press "Save"
    Then I should see "Time Entry has been updated."
    And I should see "Time spent: 9 hours 49 minutes" within "#ticket #time_spent"
    And I should see "12/30/2012"
    And I should see "0:15"

  Scenario: I can not change a time entry for another user when I do not have permission
    Given I am signed in as "user2@example.com"
    And I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"
    Then I should see "Time spent: 9 hours 50 minutes" within "#ticket #time_spent"
    And I should not see "Edit" within "#access_time_entry_0"
    And I should see "Edit" within "#access_time_entry_1"

  Scenario: I can delete a time entry
    Given I am signed in as "user@example.com"
    And I am on the homepage
    And I follow "Time Tracker" within "#projects"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"
    Then I should see "Time spent: 9 hours 50 minutes" within "#ticket #time_spent"
    And I follow "Delete" within "#access_time_entry_0"
    Then I should see "Time Entry has been deleted"
    And I should see "Time spent: 3 hours 32 minutes" within "#ticket #time_spent"
