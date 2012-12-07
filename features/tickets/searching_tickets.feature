Feature: Searching tags
  In order to find specific tickets
  As a user
  I want to enter a search string and get tickets with matching tags

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can tag the "Time Tracker" project
    And there is a default ticket state called "Open"
    And there is a ticket state called "Closed"
    And "user@example.com" has created a ticket for this project:
      | title | description    | tags        | state |
      | Tag!  | Hey! You're it | iteration_1 | Open  |
    And "user@example.com" has created a ticket for this project:
      | title   | description         | tags             | state  |
      | Tagged! | Hey! No you are not | iteration_2 find | Closed |
    And "user@example.com" has created a ticket for this project:
      | title  | description     | tags | state |
      | Found! | Hey! I am found | find | Open  |
    Given I am on the homepage
    And I follow "Time Tracker" within "#projects"

  Scenario: Finding by tag
    When I fill in "Search" with "tag:iteration_1"
    And I press "Search"
    Then I should see "Tag!"
    And I should not see "Tagged!"
    And I should not see "Found!"

  Scenario: Finding by ticket state
    When I fill in "Search" with "state:Open"
    And I press "Search"
    Then I should see "Tag!"
    And I should see "Found!"
    And I should not see "Tagged!"

  Scenario: Finding by ticket state or has tag
    When I fill in "Search" with "state:Open tag:find"
    And I press "Search"
    Then I should see "Found!"
    And I should not see "Tag!"
    And I should see "Tagged!"

  Scenario: Clicking a tag goes to search results
    When I follow "Tag!"
    And I follow "iteration_1"
    Then I should see "Tag!"
    And I should not see "Tagged!"
    And I should not see "Found!"


