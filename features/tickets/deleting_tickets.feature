Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them go away

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a default project state called "Open"
    Given there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can delete tickets in the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title         | description                    |
      | Make it shiny | Gradients Starbursts! Oh My    |
    Given I am on the homepage
    When I follow "Time Tracker"
    And I follow "Make it shiny"

  Scenario: Deleting a ticket
    When I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "Time Tracker"

