Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want a form to edit tickets

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a default project state called "Open"
    Given there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can edit tickets in the "Time Tracker" project
    And "user@example.com" can tag the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title         | description                    |
      | Make it shiny | Gradients Starbursts! Oh My    |
    Given I am on the homepage
    When I follow "Time Tracker"
    And I follow "Make it shiny"
    When I follow "Edit Ticket"

  Scenario: Updating a ticket
    When I fill in "Title" with "Make it really shiny"
    And I fill in "Tags" with "Many tags make light work"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated."
    And I should see "Make it really shiny" within "#ticket h3"
    And I should see "light" within "div#tags"
    But I should not see "Make it shiny"

  Scenario: Updating a ticket with invalid info
    When I fill in "Title" with ""
    And I press "Update Ticket"
    Then I should see "Ticket has not been updated."

