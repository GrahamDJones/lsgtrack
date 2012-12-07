Feature: Viewing ticket states
  In order to see information about a ticket state
  As an admin
  I want to be able to see a list of ticket states and view the details on each one

  Background:
    Given I have run the seed task
    And I am signed in as "admin@example.com"

  Scenario: Viewing a list of ticket states
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Ticket States"
    Then I should see "New" within "#state_table"
    And I should see "Open" within "#state_table"
    And I should see "Closed" within "#state_table"
