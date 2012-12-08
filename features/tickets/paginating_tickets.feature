Feature: Paginating tickets
  In order to ease the load on the server
  As the system
  I want to paginate ticket results

  Background:
    And there is a default project state called "Open"
    Given there is a project called "Time Tracker"
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And "user@example.com" can view the "Time Tracker" project
    And I am signed in as them
    And there are 100 tickets for this project
    When I am on the homepage
    And I follow "Time Tracker"

  Scenario: Viewing the second page
    Then I should see 4 pages of pagination
    When I follow "Next" within ".pagination .next"
    Then I see page 2 of tickets for this project
