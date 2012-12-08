Feature: Paginating projects
  In order to ease the load on the server
  As the system
  I want to paginate project lists

  Background:
    And there is a default project state called "Open"
    Given there are 100 projects
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And "user@example.com" can view all projects
    And I am signed in as them
    When I am on the homepage

  Scenario: Viewing the second page
    Then I should see 4 pages of pagination
    When I follow "Next" within ".pagination .next"
    Then I see page 2 of projects
