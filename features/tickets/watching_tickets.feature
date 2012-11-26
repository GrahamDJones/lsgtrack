Feature: Watching tickets
  In order to keep up to date with tickets
  As a user
  I want to be able to choose to subscribe to their updates

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    Given there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very soon now |
    Given I am signed in as "user@example.com"
    Given I am on the homepage

  Scenario: Ticket watch toggling
    When I follow "Time Tracker"
    And I follow "Release date"
    Then I should see "user@example.com" within "#watchers"
    And I press "Stop watching this ticket"
    Then I should see "You are no longer watching this ticket"
    And I should not see "user@example.com" within "#watchers"

    When I press "Watch this ticket"
    Then I should see "You are now watching this ticket"
    And I should see "user@example.com" within "#watchers"
