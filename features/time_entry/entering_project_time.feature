Feature: Entering time for projects
  In order to be able to enter time spent reports
  As a user
  I want a simple form to make entries accessible from the project page

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a ticket state called "Closed"
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

  @javascript
  Scenario: Reporting time less than 1 hour for a project
    And I follow "Time Entry"
    And I select "Work on this one" from "time_entry_ticket_id"
    And I fill in the date
    And I fill in "Duration" with "5"
    And I press "Save"
    Then I should see "Time Entry has been created."
    And I should see "Time spent: 5 minutes" within "#ticket #time_spent"

  @javascript
  Scenario: Reporting time in minutes for a project
    And I follow "Time Entry"
    And I select "Work on this one" from "time_entry_ticket_id"
    And I fill in the date
    And I fill in "Duration" with "105"
    And I press "Save"
    Then I should see "Time Entry has been created."
    And I should see "Time spent: 1 hour 45 minutes" within "#ticket #time_spent"

  @javascript
  Scenario: Reporting time as fractional hours for a project
    And I follow "Time Entry"
    And I select "Work on this one" from "time_entry_ticket_id"
    And I fill in the date
    And I fill in "Duration" with "1.75"
    And I press "Save"
    Then I should see "Time Entry has been created."
    And I should see "Time spent: 1 hour 45 minutes" within "#ticket #time_spent"

  @javascript
  Scenario: Reporting time as hours and minutes for a project
    And I follow "Time Entry"
    And I select "Work on this one" from "time_entry_ticket_id"
    And I fill in the date
    And I fill in "Duration" with "1:45"
    And I press "Save"
    Then I should see "Time Entry has been created."
    And I should see "Time spent: 1 hour 45 minutes" within "#ticket #time_spent"

  @javascript
  Scenario: Reporting time in exact hours for a project
    And I follow "Time Entry"
    And I select "Work on this one" from "time_entry_ticket_id"
    And I fill in the date
    And I fill in "Duration" with "60"
    And I press "Save"
    Then I should see "Time Entry has been created."
    And I should see "Time spent: 1 hour exactly" within "#ticket #time_spent"

  Scenario: Reporting time with missing date or duration or ticket not allowed
    And I follow "Time Entry"
    And I press "Save"
    Then I should see "Time Entry has not been created."
    And I should see "Date can't be blank"
    And I should see "Duration can't be blank"
    And I should see "Ticket can't be blank"
