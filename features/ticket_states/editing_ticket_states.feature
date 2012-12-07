Feature: Editing ticket states
  In order to alter ticket state information
As an admin
I want to be able to alter ticket state attributes

Background:
  Given I have run the seed task
  And I am signed in as "admin@example.com"
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Ticket States"
  And I follow "Edit" within "#access_state_open"

  Scenario: Updating a ticket state with valid attributes
    And I fill in "Name" with "Different"
    And I fill in "Color" with "bisque"
    And I fill in "Background" with "yellow"
    And I press "Update Ticket State"
    Then I should see "Ticket State has been updated."

  Scenario: Updating a ticket state with missing name
    And I fill in "Name" with ""
    And I press "Update Ticket State"
    Then I should see "Ticket State has not been updated."

  Scenario: Updating a ticket state with duplicate colors
    And I fill in "Color" with "bisque"
    And I fill in "Background" with "bisque"
    And I press "Update Ticket State"
    Then I should see "Ticket State has not been updated."
