Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them go away

  Background:
    Given there is a project called "Time Tracker"
    And that project has a ticket:
      | title         | description                    |
      | Make it shiny | Gradients Starbursts! Oh My    |
    Given I am on the homepage
    When I follow "Time Tracker"
    And I follow "Make it shiny"

  Scenario: Deleting a ticket
    When I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "Time Tracker"

