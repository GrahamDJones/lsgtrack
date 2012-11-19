Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit tickets

  Background:
    Given there is a project called "Time Tracker"
    And that project has a ticket:
      | title         | description                    |
      | Make it shiny | Gradients Starbursts! Oh My    |
    Given I am on the homepage
    When I follow "Time Tracker"
    And I follow "Make it shiny"
    When I follow "Edit Ticket"

  Scenario: Updating a ticket
    When I fill in "Title" with "Make it really shiny"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated."
    And I should see "Make it really shiny" within "#ticket h2"
    But I should not see "Make it shiny"

  Scenario: Updating a ticket with invalid info
    When I fill in "Title" with ""
    And I press "Update Ticket"
    Then I should see "Ticket has not been updated."

