Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them go away

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    Given there is a project called "Time Tracker"
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

