Feature: Managing ticket states
  In order to change information about a ticket state
  As an admin
  I want to be able to set a ticket state's name and default status

  Background:
    Given I have run the seed task
    And I am signed in as "admin@example.com"

  Scenario: Marking a ticket state as default
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Ticket States"
    And I follow "Make default" within "#set_default_to_open"
    Then I should see "Open is now the default ticket state."
