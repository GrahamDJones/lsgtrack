Feature: Creating tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and add a ticket to it

  Background:
    Given there is a project called "Internet Explorer"
    And there are the following users:
      | email            | password |
      | user@example.com | password |
    And "user@example.com" can view the "Internet Explorer" project
    And I am signed in as them
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"

  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "My pages are ugly"
    And I press "Create Ticket"
    Then I should see "Ticket has been created."
    And I should see "Created by user@example.com"

  Scenario: Creating a ticket with invalid attributes fails
    And I press "Create Ticket"
    Then I should see "Ticket has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"

  Scenario: Description must be longer than 10 chars
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "It sucks"
    And I press "Create Ticket"
    Then I should see "Ticket has not been created."
    And I should see "Description is too short"


