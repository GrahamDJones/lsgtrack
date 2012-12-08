Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a ticket state called "Closed"
    And there is a default ticket state called "Open"
    And there is a default project state called "Open"
    And there is a project called "LSG Tracker"
    And "user@example.com" can view the "LSG Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title                   | description                            |
      | Change a ticket's state | You should be able to create a comment |
    Given I am on the homepage
    And I follow "LSG Tracker" within "#projects"

  Scenario: Creating a comment
    When I follow "Change a ticket's state"
    And I fill in "Text" with "Added a comment!"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Added a comment!" within "#comments"

  Scenario: Creating an invalid comment
    When I follow "Change a ticket's state"
    And I press "Create Comment"
    Then I should see "Comment has not been created."
    And I should see "Text can't be blank"

  Scenario: Changing a ticket's state
    Given "user@example.com" can change ticket states on the "LSG Tracker" project
    When I follow "Change a ticket's state"
    When I fill in "Text" with "This is a real issue"
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket .state"
    Then I should see "Open" within "#comments"

  Scenario: A user without permission cannot change the ticket state
    When I follow "Change a ticket's state"
    Then I should see "Open" within "#ticket .state"
    Then I should not see the "#comment_ticket_state_id" element
    When I fill in "Text" with "This is a stateless issue"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket .state"

  Scenario: Adding a tag to a ticket
    Given "user@example.com" can change ticket states on the "LSG Tracker" project
    And "user@example.com" can tag the "LSG Tracker" project
    When I follow "Change a ticket's state"
    Then I should not see "bug" within "#ticket #tags"
    When I fill in "Text" with "Adding the bug tag"
    And I fill in "Tags" with "bug"
    And I press "Create Comment"
    Then I should see "Comment has been created"
    Then I should see "bug" within "#ticket #tags"




