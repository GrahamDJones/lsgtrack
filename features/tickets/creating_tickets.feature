Feature: Creating tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and add a ticket to it

  Background:
    And there is a default project state called "Open"
    Given there is a default ticket state called "Open"
    Given there is a project called "Internet Explorer"
    And there are the following users:
      | email            | password |
      | user@example.com | password |
    And "user@example.com" can view the "Internet Explorer" project
    And "user@example.com" can create tickets in the "Internet Explorer" project
    And I am signed in as them
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"

  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "My pages are ugly"
    And I press "Create Ticket"
    Then I should see "Ticket has been created."
    And I should see "Project: Internet Explorer"
    And I should see "Created by: user@example.com"
    And I should see "Open" within "#ticket .state"

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

  @javascript
  Scenario: Creating a ticket with an attachment
    When I fill in "Title" with "Add documentation for blink tag"
    And I fill in "Description" with "The blink tag has an undocumented speed attribute"
    And I attach the file "spec/fixtures/speed.txt" to "File #1"
    And I follow "Add another file"
    And I attach the file "spec/fixtures/spin.txt" to "File #2"
    And I press "Create Ticket"
    Then I should see "Ticket has been created."
#    And I should see "speed.txt" within "#ticket .assets"
#    And I should see "spin.txt" within "#ticket .assets"
#    When I follow "speed.txt"

  Scenario: Creating a ticket with tags
    Given "user@example.com" can tag the "Internet Explorer" project
    When I fill in "Title" with "Non-standards compliance"
    And I fill in "Description" with "My pages are ugly!"
    And I fill in "Tags" with "browser visual"
    And I press "Create Ticket"
    Then I should see "browser" within "#ticket #tags"
    And I should see "visual" within "#ticket #tags"

