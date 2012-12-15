Feature: Paginating time entries
  In order to ease the load on the server
  As the system
  I want to paginate time entry list results

  Background:
    Given there are the following users:
      | email             | password |
      | user@example.com  | password |
    And I am signed in as "user@example.com"
    And there is a default ticket state called "Open"
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can report time on the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title            | description                            |
      | Work on this one | You should be able to report your time |
    And there are 100 time entries for this ticket
    When I am on the homepage
    And I follow "Time Tracker"
    And I follow "Work on this one" within "#tickets"
    And I follow "Time Reported" within "#ticket"

  Scenario: Viewing the second page
    Then I should see 4 pages of pagination
    When I follow "Next" within ".pagination .next"
    Then I see page 2 of times for this ticket
