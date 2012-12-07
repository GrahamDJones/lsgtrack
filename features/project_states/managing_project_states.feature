Feature: Managing project states
  In order to change information about a project state
  As an admin
  I want to be able to set a project state's name and default status

  Background:
    Given I have run the seed task
    And I am signed in as "admin@example.com"

  Scenario: Marking a project state as default
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Project States"
    And I follow "Make default" within "#access_state_open"
    Then I should see "Open is now the default project state."
