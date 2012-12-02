Feature: Watching tickets
  In order to keep up to date with tickets
  As a user
  I want to be able to choose to subscribe to their updates

  Background:
    Given there are the following users:
      | email            | password |
      | user1@example.com | password |
      | user2@example.com | password |
    Given there is a project called "Time Tracker"
    And "user1@example.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very soon now |
    And "user1@example.com" can view the "Time Tracker" project
    And "user2@example.com" can view the "Time Tracker" project
    And "user2@example.com" can edit the "Time Tracker" project

  Scenario: Ticket watch toggling
    Given I am signed in as "user1@example.com"
    Given I am on the homepage
    When I follow "Time Tracker"
    And I follow "Release date"
    Then I should see "user1@example.com" within "#watchers"
    And I press "Stop watching this ticket"
    Then I should see "You are no longer watching this ticket"
    And I should not see "user1@example.com" within "#watchers"

    When I press "Watch this ticket"
    Then I should see "You are now watching this ticket"
    And I should see "user1@example.com" within "#watchers"

    Scenario: Creating additional comments does not sign me up to watch more than once
      Given I am signed in as "user2@example.com"
      Given I am on the homepage
      When I follow "Time Tracker"
      And I follow "Release date"
      And I fill in "Text" with "When is very soon?"
      And I press "Create Comment"
      Then I should see "Comment has been created."
      And I should see "user2@example.com" within "#watchers"
      And I fill in "Text" with "Never Mind, next Monday is OK"
      And I press "Create Comment"
      Then I should see "Comment has been created."
      And there should be 2 watchers
